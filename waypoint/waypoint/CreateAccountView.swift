import SwiftUI

struct CustomTextField: View {
    let icon: String
    let placeholder: String
    @Binding var text: String
    var isSecure: Bool = false

    @State private var isVisible: Bool = false
    private let textColor = Color(red: 75/255, green: 91/255, blue: 99/255)

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)

            Group {
                if isSecure && !isVisible {
                    SecureField("", text: $text, prompt: Text(placeholder).foregroundColor(textColor))
                } else {
                    TextField("", text: $text, prompt: Text(placeholder).foregroundColor(textColor))
                }
            }

            if isSecure {
                Button(action: { isVisible.toggle() }) {
                    Image(systemName: isVisible ? "eye" : "eye.slash")
                }
            }
        }
        .foregroundColor(textColor)
        .padding(.horizontal, 20)
        .padding(.vertical, 18)
        .background(Color(red: 0.93, green: 0.92, blue: 0.93))
        .cornerRadius(14)
    }
}

struct CreateAccountView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var password = ""
    @Environment(\.dismiss) private var dismiss
    private let textColor = Color(red: 75/255, green: 91/255, blue: 99/255)

    var body: some View {
        VStack(spacing: 20) {
            VStack(spacing: 6) {
                Text("Hey there,")
                    .foregroundColor(.gray).font(.system(size: 16))
                Text("Create an Account")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(textColor)
            }
            .padding(.top, 40)

            VStack(spacing: 16) {
                CustomTextField(icon: "person", placeholder: "First Name", text: $firstName)
                CustomTextField(icon: "person", placeholder: "Last Name", text: $lastName)
                CustomTextField(icon: "envelope", placeholder: "Email", text: $email)
                CustomTextField(icon: "lock", placeholder: "Password", text: $password, isSecure: true)
            }

            Spacer()

            Button(action: {
                // handle registration
            }) {
                Text("Register")
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
                Text("Already have an account?")
                    .foregroundColor(.gray)
                Button(action: { dismiss()}) {
                    Text("Login")
                        .bold()
                        .foregroundColor(textColor)
                }
            }
            .font(.system(size: 14))
            .padding(.bottom, 20)
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    CreateAccountView()
}
