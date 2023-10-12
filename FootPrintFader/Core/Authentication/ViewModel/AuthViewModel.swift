//
//  AuthViewModel.swift
//  FootPrintFader
//
//  Created by Zaid Maraqa on 15/08/2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}

@MainActor
class AuthViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?

    
    init(){
        self.userSession = Auth.auth().currentUser
        
        Task{
            await fetchUser()
        }
        
    }
    
    func signIn(withEmail email: String, password: String) async throws{
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch{
            print("DEBUG: Failed to log in with error \(error.localizedDescription)")
            
        }
    }
    
    func createUser(withEmail email: String, password: String, fullname: String) async throws{
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullname: fullname, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch{
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
            
        }
        
    }
    
    func signOut(){
        do{
            try Auth.auth().signOut() // Signs out user on backend
            print("Firebase Current User after signout: \(String(describing: Auth.auth().currentUser))")
            self.userSession = nil
            self.currentUser = nil //Wipes our current user data model
            print("USER SIGNED OUT")
        } catch{
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
        
    }
    
    func deleteAccount(){
        
    }
    
    func fetchUser() async{
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        guard let snapshot = try? await Firestore.firestore()
            .collection("users").document(uid).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: User.self)
        
        if let user = self.currentUser {
            print("DEBUG: Current user is \(user)")
        } else {
            print("DEBUG: Current user is nil")
        }
    }
    
    func saveFootprintToFirebase(footprint: Double) {
            guard let uid = Auth.auth().currentUser?.uid else { return }
            
            Firestore.firestore().collection("users").document(uid).updateData(["carbonFootprint": footprint]) { (error) in
                if let error = error {
                    print("Failed to update carbon footprint: \(error.localizedDescription)")
                }
                else {
                    print("Successfully updated carbon footprint for user.")
            }
        }
    }
    
    
}
