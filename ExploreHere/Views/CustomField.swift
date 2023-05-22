//
//  CustomField.swift
//  Course
//
//  Created by mac on 5/20/23.
//

import SwiftUI

struct CustomEpicTopiaField: View {
    //密码明文密文切换
    @State var isSecured:Bool = false
    //输入框内容
    @Binding var customText:String
    //普通输入框还是秘密输入框/默认普通输入框
    var isSecuredInoput:Bool = true
    //未输入内容提示语
    var placeholder:String = "placeholder"
    //前置图标
    var prefixIcon:String = "PsdLogo"
    
    //字数限制
    var limitCount:Int = Int.max
    
    var keyBoardEnumType: UIKeyboardType = .default
    
    var retureEvent : (() -> Void)? = {}
    
    var body: some View {
        HStack{
            Image(prefixIcon)
            ZStack(alignment: .trailing) {
                if isSecuredInoput {
                    if isSecured {
                        SecureField(placeholder, text: $customText){
                            if let retureEvent = self.retureEvent{
                                retureEvent()
                            }else{
                                print("Error")
                            }
                        }
                        .font(.callout)
                        .accentColor(Color.black)
                        .keyboardType(keyBoardEnumType)
                        .onChange(of: customText) { V in
                            customText = String(V.prefix(limitCount))
                        }
                    } else {
                        TextField(placeholder, text: $customText){
                            if let retureEvent = self.retureEvent{
                                retureEvent()
                            }else{
                                print("Error")
                            }
                        }
                        .font(.callout)
                        .accentColor(Color.black)
                        .keyboardType(keyBoardEnumType)
                        .onChange(of: customText) { V in
                            customText = String(V.prefix(limitCount))
                        }
                    }
                    Button(action: {
                        isSecured.toggle()
                    }) {
                        Image(self.isSecured ? "hiddenPsd" : "showPsd").resizable().frame(width: 27, height: 27)
                    }
                    .opacity(customText.trimmingCharacters(in: .whitespacesAndNewlines).count > 0 ? 1 : 0)
                }else{
                    TextField(placeholder, text: $customText){
                        if let retureEvent = self.retureEvent{
                            retureEvent()
                        }else{
                            print("Error")
                        }
                    }
                    .font(.callout)
                    .accentColor(Color.black)
                    .keyboardType(keyBoardEnumType)
                    .onChange(of: customText) { V in
                        customText = String(V.prefix(limitCount))
                    }
                    Button(action: {
                        customText = ""
                    }) {
                        Image("inputClear").resizable().frame(width: 27, height: 27)
                    }
                    .opacity(customText.trimmingCharacters(in: .whitespacesAndNewlines).count > 0 ? 1 : 0)
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical,14)
        .background(Color.white.opacity(0.8))
        .cornerRadius(12)
        .padding(.horizontal,24)
    }
}
