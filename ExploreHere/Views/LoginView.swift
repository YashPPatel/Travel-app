//
//  LoginView.swift
//  ExploreHere
//
//  Created by mac on 5/21/23.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    @State var account:String = ""
    @State var psd:String = ""
    @State var username = "Username"
    @State var password = "Password"
    
    @AppStorage("ifSucceed") var ifSucceed:Bool = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .center){
                Image("login_02")
                    .resizable()
                    .scaledToFill()
                VStack(spacing: 15){
                    Spacer()
                    VStack(spacing: 15){
                        CustomEpicTopiaField(isSecured:false,customText: $account, isSecuredInoput: false, placeholder:"Account", prefixIcon:"EmailLogo", keyBoardEnumType: .emailAddress)
                        CustomEpicTopiaField(isSecured: true,customText: $psd,placeholder:"Password")
                        defaultBtn(text: "Sign In", ifTheme: account.trimmingCharacters(in: .whitespacesAndNewlines).count > 0 && psd.trimmingCharacters(in: .whitespacesAndNewlines).count > 0)
                            .onTapGesture(perform: {
                                LoginEvent(){
                                    ifSucceed = true
                                }
                            })
                            .padding(.top,30)
                    }
                    .padding(.top,40)
                    
                    Text("or")
                        .foregroundColor(.gray)
                        .font(.title3)
                    
                    SignInWithAppleButton(.continue) { request in
                        request.requestedScopes = [.email, .fullName]
                    } onCompletion: { result in
                        switch result {
                        case .success(let auth):
                            switch auth.credential {
                            case let credential as ASAuthorizationAppleIDCredential:
                                //苹果登陆
                                print( credential.email ?? "")
                                
                                break
                            default:
                                break
                            }
                        case .failure(let error):
                            print(error)
                        }
                    }
                    .frame(width: width*0.8,height: 44)
                    .signInWithAppleButtonStyle(SignInWithAppleButton.Style.white)
                    .cornerRadius(10)
                    .padding(.bottom,height*0.15)
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .ignoresSafeArea()
            .navigationTitle(Text("Login").foregroundColor(.white))
            .navigationBarTitleDisplayMode(.large)
        }
    }
    func defaultBtn(text:String,ifTheme:Bool) -> some View {
        Text(text)
            .font(.callout)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding(.vertical,12)
            .frame(width: width*0.8)
            .background(LinearGradient(gradient: Gradient(colors: [ifTheme ? Color(red: 0.18, green: 0.49, blue: 1) : Color(red: 0.87, green: 0.87, blue: 0.87), ifTheme ?  Color(red: 0.47, green: 0.46, blue: 0.98) : Color(red: 0.87, green: 0.87, blue: 0.87)]), startPoint: .trailing, endPoint: .leading))
            .cornerRadius(12)
        
    }
    func LoginEvent(completion: @escaping () -> Void?) {
        if account.trimmingCharacters(in: .whitespacesAndNewlines).count > 0 && psd.trimmingCharacters(in: .whitespacesAndNewlines).count > 0 {
            completion()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
