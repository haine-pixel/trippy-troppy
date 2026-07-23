//
//  ResetPassword.swift
//  waypoint
//
//  Created by joeyi on 24/7/26.
//

import SwiftUI

// -- global
private let textColor = Color(red: 75/255, green: 91/255, blue: 99/255)

// -- set pw int
struct HeaderText: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Set a new password")                 .font(.system(size: 20))
                .foregroundColor(textColor)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)

            Text("Create a new password. Ensure it differs from previous ones for security")
        }
    }
}

struct Fields: View {
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        VStack(spacing: 16) {
            CustomTextField(icon: "lock", placeholder: "Password", text: $password)
            CustomTextField(icon: "lock", placeholder: "Confirm password", text: $confirmPassword)
        }
        .padding(.top, 18)
        .padding(.bottom, 18)
    }
}

struct UpdatePasswordBtn: View {
    var action: () -> Void
    var body: some View {
        Text("Update Password")
            .foregroundColor(Color(red: 0.93, green: 0.92, blue: 0.93))
            .frame(maxWidth: .infinity)
            .padding()
            .background(textColor)
            .cornerRadius(30)
            .font(.system(size: 16))
    }
}

// consolidated view
struct ResetPasswordView: View {
    var body: some View {
        VStack(spacing: 20) {
            VStack(spacing: 24) {
                HeaderText()
                Fields()
                UpdatePasswordBtn{print("clicked")}
            }
        }
        .padding(.horizontal, 24)
    }
}

// -- prompt after successful change of pw
struct Successful: View {
    var body: some View {
        VStack(spacing: 20) {
                
            Text("Successful")
                .font(.system(size: 20))
                .foregroundColor(textColor)
                .bold()
            Text("Congratulations! Your password has been changed. Click continue to login")
                .foregroundStyle(.gray)
        }
        .padding(.horizontal, 24)
    }
}

struct SuccessfulBtn: View {
    var action: () -> Void
    var body: some View {
        VStack(spacing: 26) {
            Text("Continue")
                .foregroundColor(Color(red: 0.93, green: 0.92, blue: 0.93))
                .frame(maxWidth: .infinity)
                .padding()
                .background(textColor)
                .cornerRadius(30)
                .font(.system(size: 16))
        }
    }
}

// consolidated view
struct SuccessfulView: View {
    var body: some View {
        VStack(spacing: 26) {
            Successful()
            SuccessfulBtn{(print("clicked"))}
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    ResetPasswordView()
}
