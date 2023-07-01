import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            Image("CarbonBackground") // replace "background" with your image name
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                Text("CarbonFader")
                    .font(.system(size: 50, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 2, x: 0, y: 2)

                Text("The first step to fading your print!")
                    .font(.system(size: 25, weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 2, x: 0, y: 2)
                Spacer()

                NavigationLink(destination: CalculatorView()) {
                    Text("Get Started")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: 220, height: 60)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color.green, Color.white]), startPoint: .leading, endPoint: .trailing)
                        )
                        .cornerRadius(30)
                        .shadow(color: .green, radius: 20, x: 0, y: 20)
                }
                .padding(.bottom)
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
