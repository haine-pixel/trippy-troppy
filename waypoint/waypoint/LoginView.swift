//
//  LoginView.swift
//  waypoint
//
//  Created by Toh Dai En on 23/7/26.
//
import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var goToCreateAccount = false

    private let textColor = Color(red: 75/255, green: 91/255, blue: 99/255)

    var body: some View {
        VStack(spacing: 20) {
            VStack(spacing: 6) {
                Text("Welcome Back")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(textColor)
            }
            .padding(.top, 40)

            VStack(spacing: 16) {
                CustomTextField(icon: "envelope", placeholder: "Email", text: $email)
                CustomTextField(icon: "lock", placeholder: "Password", text: $password, isSecure: true)
                Button(action: {
                    // handle forgot password action
                }) {
                    Text("Forgot your password?")
                        .underline()
                        .foregroundColor(textColor)
                        .font(.system(size: 14))
                }
            }

            Spacer()

            Button(action: {
                // handle registration
            }) {
                Text("Login")
                    .foregroundColor(Color(red: 0.93, green: 0.92, blue: 0.93))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(textColor)
                    .cornerRadius(30)
                    .font(.system(size: 16))
            }

            HStack {
                VStack { Divider() }
                Text("Or").foregroundColor(.gray).font(.system(size: 12))
                VStack { Divider() }
            }

            HStack(spacing: 16) {
                Button(action: {}) {
                    Image(systemName: "g.circle.fill")
                        .foregroundColor(.red)
                        .font(.system(size: 22))
                        .frame(width: 50, height: 50)
                        .background(Color.white)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray.opacity(0.3)))
                }
                Button(action: {}) {
                    Image(systemName: "f.circle.fill")
                        .foregroundColor(.blue)
                        .font(.system(size: 22))
                        .frame(width: 50, height: 50)
                        .background(Color.white)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray.opacity(0.3)))
                }
            }

            HStack(spacing: 4) {
                Text("Dont have an account yet?")
                    .foregroundColor(.gray).font(.system(size: 14))
                Button(action: {
                    // handle register account action
                    goToCreateAccount = true
                }) {
                    Text("Register")
                        .underline()
                        .foregroundColor(textColor)
                        .font(.system(size: 14))
                }}
            
            .font(.system(size: 14))
            .padding(.bottom, 20)
        }
        .padding(.horizontal, 24).navigationDestination(isPresented: $goToCreateAccount){CreateAccountView()}

    }}




#Preview {
    LoginView()
}
