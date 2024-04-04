//
//  ContentView.swift
//  Sample Mac OS Project
//
//  Created by Mallikarjuunarao. Mupparaju on 09/09/22.
//

import SwiftUI

struct ContentView: View {
    @State var username = "";
    @State var password = "";
    @State var viewSelected = false
    var body: some View {
            if !viewSelected {
                ZStack{
                    Image("login-4")
                        .resizable()
                    
                    VStack(alignment: .leading){
                        VStack(alignment: .leading){
                            Image("logo-4")
                                .resizable()
                                .frame(width: 60, height: 60)
                            Spacer()
                                .frame(height:25)
                            Text("Sign-In to Continue........")
                                .modifier(CustomTextM(fontName: "MavenPro-Regular", fontSize: 22, fontColor: Color.primary))
                            Spacer()
                                .frame(height:25)
                        }
                        
                        VStack {
                            VStack(alignment: .leading){
                                VStack {
                                    SFInputComponent(inputTitle: "Username", username: $username, isSecure: false)
                                    Spacer()
                                        .frame(height:25)
                                    SFInputComponent(inputTitle: "Password", username: $password, isSecure: true)
                                    Spacer()
                                        .frame(height:25)
                                    Text("Forgot Password?")
                                        .modifier(CustomTextM(fontName: "MavenPro-Medium", fontSize: 16, fontColor: Color.gray))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                Spacer()
                                    .frame(height:10)
                            
                                    Button(action: {
                                        self.viewSelected = true
                                    }){
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 5)
                                                .frame(maxWidth: .infinity, minHeight: 36, maxHeight: 36)
                                                .foregroundColor(Color("yellow"))
                                            Text("Sign-In")
                                                .modifier(CustomTextM(fontName: "MavenPro-Bold", fontSize: 16, fontColor: Color.black))
                                        }
                                    }.buttonStyle(PlainButtonStyle())
        
                            }
                            .padding(.horizontal,30)
                            .padding(.vertical,20)
                        }
                        .background(Color("card"))
                        .cornerRadius(10)
                        .shadow(radius: 20.0)
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            ZStack{
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(width: 250, height: 30)
                                    .foregroundColor(Color("yellow"))
                                HStack{
                                    Text("New?")
                                    Text("Sign-up")
                                        .modifier(CustomTextM(fontName: "MavenPro-Bold", fontSize: 16, fontColor: Color.primary))
                                    Text("for a new account.")
                                }
                                .modifier(CustomTextM(fontName: "MavenPro-Medium", fontSize: 14, fontColor: Color.primary))
                            }
                        }.buttonStyle(PlainButtonStyle())
                        Spacer()
                    }.padding(20)
                }.frame(minWidth: 600, minHeight: 480)
            }else if viewSelected {
                TabBarView()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SFInputComponent: View {
    @State var inputTitle: String
    @Binding var username: String
    @State var isSecure: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 18){
            Text(inputTitle)
                .modifier(CustomTextM(fontName: "MavenPro-Medium", fontSize: 16, fontColor: Color.gray))
            Group{
                if !isSecure {
                    TextField("", text: $username)
                } else {
                    SecureField("", text: $username)
                }
            }.textFieldStyle(PlainTextFieldStyle()).padding(10)
            .font(Font.system(size: 15, weight: .medium, design: .serif))
            .foregroundColor(.primary)
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 0.5).frame(height: 36).foregroundColor(Color.white))
        }
    }
}

struct CustomTextM: ViewModifier {
    let fontName: String
    let fontSize: CGFloat
    let fontColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.custom(fontName, size: fontSize))
            .foregroundColor(fontColor)
    }
}
