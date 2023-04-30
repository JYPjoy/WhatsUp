//
//  LoginView.swift
//  WhatsUp
//
//  Created by Joy on 2023/04/30.
//

import SwiftUI
import FirebaseAuth

/*
 Async, Await 이란?
 기존에 비동기 처리 방식은 DispatchQueue나 completionHandler를 사용하여 처리했지만, 더욱 편하게 비동기 처리할 수 있는 문법
 */

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @EnvironmentObject private var appState: AppState
    
    private var isFormValid: Bool {
        !email.isEmptyOrWhiteSpace && !password.isEmptyOrWhiteSpace
    }
    
    private func login() async {
        do {
            let _ = try await Auth.auth().signIn(withEmail: email, password: password)
            // go to the main screen
            appState.routes.append(.main)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    var body: some View {
        Form{
            TextField("Email", text: $email)
                .textInputAutocapitalization(.never)
            SecureField("Password", text: $password)
                .textInputAutocapitalization(.never)
            HStack {
                Spacer()
                Button("Login"){
                    Task{
                        await login()
                    }
                }.disabled(!isFormValid)
                
                Button("SignUp"){
                    //go to the signUp page
                    appState.routes.append(.signUp)
                }.buttonStyle(.borderless)
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(AppState())
    }
}
