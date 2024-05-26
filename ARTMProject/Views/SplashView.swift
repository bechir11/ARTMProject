//
//  SplashView.swift
//  ARTMProject
//
//  Created by Bechir Belkahla on 25/5/2024.
//



import SwiftUI

struct SplashView: View {
    
    @State var isActive: Bool = false
    @State var rotationAngle: Double = 0
    
    var body: some View {
        ZStack {
            if self.isActive {
                CountryListView()
            } else {
                VStack {
                    Image("world")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, height: 400)
                        .rotationEffect(Angle.degrees(rotationAngle))
                        .onAppear {
                            //Making a continuous rotation of the image
                            withAnimation(Animation.linear(duration: 10).repeatForever(autoreverses: false)) {
                                rotationAngle = 360
                            }
                        }
                        .transition(.opacity)
                    Text("ARTM Country App")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                }
            }
        }
        .onAppear {
            //Displaying the country list View
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
    
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
