//
//  LoginView.swift
//  RemoteCoach
//
//  Created by Irwin Gonzales on 9/22/20.
//  Copyright © 2020 Irwin Gonzales. All rights reserved.
//

//import Auth0
import SwiftUI

struct LoginView: View {
//    @ObservedObject var viewRouter: ViewRouter

    var body: some View {
//        Main(viewRouter: viewRouter)
        Main()
            .edgesIgnoringSafeArea(.all)
            .statusBar(hidden: true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
//        LoginView(viewRouter: ViewRouter())
        LoginView()
    }
}

struct Main: View {

    @State private var isAuthenticated = false
    @State var tokenID = String()
//    @ObservedObject var viewRouter: ViewRouter
//    var user: User?
//    var userManager = UserManager()
    @State var signup = false

    @State private var email = ""
    @State private var password = ""
    @State var confirmPassword = ""

    var body: some View {
        ZStack {
            ZStack {
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
                    Color(#colorLiteral(red: 0.3873129189, green: 0.1663506031, blue: 0.9966519475, alpha: 1))
                        .clipShape(CShape())

                    Path { path in
                        path.addArc(center: CGPoint(x: UIScreen.main.bounds.width - 120, y: UIScreen.main.bounds.height - 50), radius: 40, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: true)
                    }
                    .fill(Color.white)

                    // Button
                    Button(action: {
                        withAnimation(.easeIn) {
                            self.signup = false
                        }
                    }) {
                        Image(systemName: signup ? "multiply.circle.fill" : "person.fill")
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(Color(#colorLiteral(red: 0.3873129189, green: 0.1663506031, blue: 0.9966519475, alpha: 1)))
                    }
                    .offset(x: -110, y: -50)

                    Button(action: {
                        withAnimation(.easeOut) {
                            self.signup = true
                        }
                    }) {
                        Image(systemName: signup ? "person.badge.plus.fill" : "multiply.circle.fill")
                            .font(.system(size: signup ? 26 : 25, weight: .bold))
                            .foregroundColor(.white)
                    }
                    .offset(x: -30, y: -40)
                }

                // Login View
                VStack(alignment: .leading, spacing: 25) {
                    Text("Login to HomeCoach")
                        .font(.system(size: 30, weight: .medium, design: .rounded))
                        .foregroundColor(Color(.white))

                    Text("Email")
                        .foregroundColor(Color(.white))
                        .padding(.top, 10)

                    VStack {
                        TextField("Email", text: $email)
                            .cornerRadius(5)
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                            .foregroundColor(Color(.white))
                            .padding(.top, 10)

                        Divider()
                            .foregroundColor(Color.white.opacity(0.8))
                    }

                    Text("Password")
                        .foregroundColor(Color(.white))
                        .padding(.top, 10)

                    VStack {
                        SecureField("Password", text: $password)
                            .cornerRadius(5)
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                            .foregroundColor(Color(.white))
                            .padding(.top, 10)

                        Divider()
                            .foregroundColor(Color.white.opacity(0.8))
                    }

                    HStack {
                        Spacer()

                        // Login Button
                        Button(action: {
                            self.login()
                        }) {
                            Text("Login")
                                .font(.system(size: 20, weight: .medium, design: .rounded))
                                .foregroundColor(Color(#colorLiteral(red: 0.3873129189, green: 0.1663506031, blue: 0.9966519475, alpha: 1)))
                                .padding(.horizontal, 45)
                                .padding(.vertical)
                                .background(Color.white)
                                .clipShape(Capsule())
                        }
                        Spacer()
                    }
                    Spacer(minLength: 0)
                }
                .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 35)
                .padding()
            }
            // Adding Adjustment to iPhone 8 Screens
            .offset(y: signup ? -UIScreen.main.bounds.height + (UIScreen.main.bounds.height < 750 ? 100 : 130) : 0)
            .zIndex(1)

            // Signup View

            VStack(alignment: .leading, spacing: 25) {
                Text("Sign Up")
                    .font(.system(size: 30, weight: .medium, design: .rounded))
                    .foregroundColor(Color(#colorLiteral(red: 0.3873129189, green: 0.1663506031, blue: 0.9966519475, alpha: 1)))

                Text("Email")
                    .foregroundColor(Color(.white))
                    .padding(.top, 10)

                VStack {
                    TextField("Email", text: $email)
                        .cornerRadius(5)
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                        .foregroundColor(Color(#colorLiteral(red: 0.3873129189, green: 0.1663506031, blue: 0.9966519475, alpha: 1)))
                        .padding(.top, 10)

                    Divider()
                        .foregroundColor(Color.white.opacity(0.8))
                }

                Text("Password")
                    .foregroundColor(Color(.white))
                    .padding(.top, 10)

                VStack {
                    SecureField("Password", text: $password)
                        .cornerRadius(5)
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                        .foregroundColor(Color(#colorLiteral(red: 0.3873129189, green: 0.1663506031, blue: 0.9966519475, alpha: 1)))
                        .padding(.top, 10)

                    Divider()
                        .foregroundColor(Color.white.opacity(0.8))
                }

                Text("Confirm Password")
                    .foregroundColor(Color(.white))
                    .padding(.top, 10)

                VStack {
                    SecureField("Confirm Password", text: $confirmPassword)
                        .cornerRadius(5)
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                        .foregroundColor(Color(#colorLiteral(red: 0.3873129189, green: 0.1663506031, blue: 0.9966519475, alpha: 1)))
                        .padding(.top, 10)

                    Divider()
                        .foregroundColor(Color.white.opacity(0.8))
                }

                HStack {
                    Spacer()

                    // Login Button

                    Button(action: {
                        self.signUp()
                    }) {
                        Text("Sign Up")
                            .font(.system(size: 20, weight: .medium, design: .rounded))
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            .padding(.horizontal, 45)
                            .padding(.vertical)
                            .background(Color(#colorLiteral(red: 0.3873129189, green: 0.1663506031, blue: 0.9966519475, alpha: 1)))
                            .clipShape(Capsule())
                    }
                    Spacer()
                }
                Spacer(minLength: 0)
            }
            .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 35)
            .padding()
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .preferredColorScheme(signup ? .light : .dark)
    }

    func checkCreds() {
//        if SessionManager.shared.credentials != nil {
////            userManager.getLoggedInUser()
//            viewRouter.currentPage = "HomePage"
//        } else {
//            viewRouter.currentPage = "AuthPage"
//        }
    }

    func login() {
//        Auth0
//            .authentication()
//            .login(
//                usernameOrEmail: email,
//                password: password,
//                realm: "Username-Password-Authentication",
//                scope: "openid"
//            )
//            .start { result in
//                switch result {
//                case let .success(credentials):
//                    print("Credentials: \(credentials)")
//                    SessionManager.shared.store(credentials: credentials)
//                    guard let token = credentials.idToken else {
//                        return
//                    }
//                    print("Token: \(token)")
//                    //                self.getTrainers(tokenID: token)
//                    self.checkCreds()
//                case let .failure(error):
//                    print("Failed with \(error)")
//                }
//            }
    }

    func signUp() {
        if password == confirmPassword {
//            Auth0.authentication().createUser(email: email, password: password, connection: "Username-Password-Authentication").start { trainee in
//                switch trainee {
//                case let .failure(error):
//                    print("Error: \(error)")
//                case let .success(credentials):
//                    DispatchQueue.main.async {
//                        // Get Trainers Here!
//                        print("Success: \(credentials)")
//                    }
//                }
//            }
            print(password)
        } else {
            print("Error: Passwords don't match!")
        }
    }
}

// Custom Shape

struct CShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: rect.width, y: rect.height - 50))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height - 50))

            path.addArc(center: CGPoint(x: rect.width - 40, y: rect.height - 50), radius: 40, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: false)
        }
    }
}
