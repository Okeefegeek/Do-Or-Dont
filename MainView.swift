//
//  MainView.swift
//  DoOrDont
//
//  Created by Will O'Keefe on 4/17/24.
//

import SwiftUI
import Foundation

func stringer() -> String { // function to generate questions
    
    let questions = [
        "You walk past a homeless man. He asks you for some money to buy medically presribed Cannabis. 1 ",
         
    "You complete a film, as it is your greatest dream to become a famous actor. A Hollywood producer who is friends with your teacher expresses interest in you as an actor. When you get to the audition for the movie. The producer gives you a role in his movie, but only if you join him at his house later that night for an unknown activity. 3 ",
                     
                     "Would you like to watch an Ad for free value? 3 ",
                     
                     "You are an exterminator who is pitched two new products. One is a device that will kill all of the bugs and ensure they do not invade a home ever again, and one is a device that removes all of the bugs from the house in to nature. With the second product, there is a 10% chance that the bugs will invade again. 2 ",
                     
                     "You meet a Youtube influencer who offers you a course to become rich by following the instructions given to you in the course. 1 ",
                     
                     "A good friend comes to you and asks for $1000 for his emergency hand surgery. You only have $1200 dollars in your account, and the result of you not paying would be that his middle finger is removed. 4 "
    ]
    let rando = Int.random(in: 0..<questions.count) // to return random question
    
    return questions[rando]
}

func stringGen() -> String { // second function to generate questions
    
    let questions = [
    "Would you accept $50,000 dollars if it would automatically kill 10 people anywhere on Earth. 3 ",
    "Would you be interested in donating to a charity of our choice? 4 ",
    "Mystery question. Follow your intuition on this answer. 3 ",
    "A criminal comes to you and seeks forgiveness for what he has done. You do not know what he has done. 1 ",
    "You gain insider knowledge that a company is about to release a new product that will make their stock rise. You also know, however, that they create their products using child labor. Do you invest and therefore support their company? 2 "
    ]
    let rando = Int.random(in: 0..<questions.count) // to return random question
    
    return questions[rando]
}

struct MainView: View {
    @AppStorage("hon") var honor: Double = 0.5
    @AppStorage("mon") var money: Double = 0.5
    
    @State private var showOne: Bool = false
    @State private var showTwo: Bool = false
    @State private var showAdd: Bool = false
    
    @State private var caution: Bool = false
    // app storage variables to save data and make sure the questions refresh timely
    @AppStorage("tik") var used: Bool = false
    @AppStorage("tok") var usedTwo: Bool = false
    
    @AppStorage("quOne") var quest: String = ""
    @AppStorage("quTwo") var questTwo: String = ""
    
    @AppStorage("clicko") var hour = Calendar.current.component(.day, from: Date())
    
    var body: some View {
        
        let questionOne = quest.prefix(quest.count - 3)
        let decider = quest.suffix(3)
        
        let questionTwo = questTwo.prefix(questTwo.count - 3)
        let chooser = questTwo.suffix(3)
        
    
        ZStack{
            Color.brown
            Button("Enable New Questions") {
                let chomper = Calendar.current.component(.day, from: Date())
                
                if (chomper != hour) {
                    used = false
                    quest = stringer()
                    questTwo = stringGen()
                }
                else {
                    caution = true
                }
            }.alert(isPresented: $caution) {
                Alert(title: Text("Message"), message: Text("Your bars will be able to be updated again each day"), dismissButton: .default(Text("OK")))
            }.padding(7).foregroundStyle(Color.white).background(RoundedRectangle(cornerRadius: 25).fill(Color.black)).font(Font.custom("cour", size: 15)).position(x: 200, y: 425)
            VStack {
                HStack {
                    ProgressView(value: honor).tint(.white).frame(width: 100, height: 100)
                    
                    ProgressView(value: money).frame(width: 100, height: 100).tint(.green)
                }
                HStack {
                    Text("Your white bar represents Morals.").padding().font(Font.custom("cour", size: 20)).foregroundStyle(Color.black).background(Color.white.opacity(0.5)).frame(width: 400)
                }
                HStack {
                    Text("Your green bar represents Value").padding().font(Font.custom("cour", size: 21)).foregroundStyle(Color.black.opacity(1)).background(Color.green.opacity(0.5)).frame(width: 400)
                }
VStack {
    HStack {
        Text("Daily Question One").padding().foregroundStyle(Color.white).background(Color.black).clipShape(RoundedRectangle(cornerRadius: 25 )).font(Font.custom("cour", size: 15))
                        
Text("Daily Question Two").padding().foregroundStyle(Color.white).background(Color.black).clipShape(RoundedRectangle(cornerRadius: 25)).font(Font.custom("cour", size: 15))
                    }.padding()
                    HStack {
                        Button("View Question") {
                            showOne = true
                        }.padding().font(Font.custom("cour", size: 20)).foregroundStyle(Color.white).background(RoundedRectangle(cornerRadius: 25).fill(Color.black).shadow(color: Color.white, radius: 15, x:0, y:2)).popover(isPresented: $showOne) {
                            ZStack {
                                Color.brown
                                VStack {
                                    HStack {
                                        Text(questionOne).padding().foregroundStyle(Color.white).background(Color.black).clipShape(RoundedRectangle(cornerRadius: 25)).font(Font.custom("cour", size: 30))
                                    }
                                    HStack { // conditionals to add or deduct points
                                        Button("Do") {
                                            if (decider == " 1 " && !used) {
                                                money += 0.1
                                                honor += 0.1
                                                hour = Calendar.current.component(.day, from: Date())
                                            }
                                            else if (decider == " 2 " && !used) {
                                                money += 0.1
                                                honor -= 0.1
                                                hour = Calendar.current.component(.day, from: Date())
                                            }
                                            else if (decider == " 3 " && !used) {
                                                money -= 0.1
                                                honor -= 0.1
                                                hour = Calendar.current.component(.day, from: Date())
                                            }
                                            else if (decider == " 4 " && !used) {
                                                honor += 0.1
                                                money -= 0.15
                                                hour = Calendar.current.component(.day, from: Date())
                                            }
                                            showOne = false
                                            used = true
                                }.padding().background(RoundedRectangle(cornerRadius: 25).fill(Color.black)).foregroundStyle(Color.white).font(Font.custom("cour", size: 20))
                                        Button("Don't") {
                                            if (decider == " 1 " && !used) {
                                                honor -= 0.1
                                                hour = Calendar.current.component(.day, from: Date())
                                            }
                                            else if (decider == " 2 " && !used) {
                                                money -= 0.1
                                                honor += 0.1
                                                hour = Calendar.current.component(.day, from: Date())
                                            }
                                            else if (decider == " 3 " && !used) {
                                                honor += 0.1
                                                money += 0.1
                                                hour = Calendar.current.component(.day, from: Date())
                                            }
                                            else if (decider == " 4 " && !used) {
                                                money += 0.1
                                                honor -= 0.15
                                                hour = Calendar.current.component(.day, from: Date())
                                            }
                                            showOne = false
                                            used = true
                                        }.padding().background(RoundedRectangle(cornerRadius: 25).fill(Color.black)).foregroundStyle(Color.white).font(Font.custom("cour", size: 20))
                                    }
                                }
                            }.ignoresSafeArea()
                        }
                        
                        Button("View Question") {
                            showTwo = true
                        }.font(Font.custom("cour", size: 20)).padding().foregroundStyle(Color.white).background(RoundedRectangle(cornerRadius: 25).fill(Color.black).shadow(color: Color.white, radius: 15, x:0, y:2)).popover(isPresented: $showTwo) {
                            ZStack {
                                Color.brown
                                VStack {
                                    HStack {
                                        Text(questionTwo).padding().foregroundStyle(Color.white).background(Color.black).clipShape(RoundedRectangle(cornerRadius: 25)).font(Font.custom("cour", size: 30))
                                    }
                                    HStack {
                                        Button("Do") {
                                            if (chooser == " 1 " && !usedTwo) {
                                                money += 0.1
                                                honor += 0.1
                                            }
                                            else if (chooser == " 2 " && !usedTwo) {
                                                money += 0.1
                                                honor -= 0.1
                                            }
                                            else if (chooser == " 3 " && !usedTwo) {
                                                money -= 0.1
                                                honor -= 0.1
                                            }
                                            else if (chooser == " 4 " && !usedTwo) {
                                                honor += 0.1
                                                money -= 0.15
                                            }
                                            showTwo = false
                                            usedTwo = true
                                        }.padding().background(RoundedRectangle(cornerRadius: 25).fill(Color.black)).foregroundStyle(Color.white).font(Font.custom("cour", size: 20))
                                        
                                        Button("Don't") {
                                            if (chooser == " 1 " && !usedTwo) {
                                                honor -= 0.1
                                            }
                                            else if (chooser == " 2 " && !usedTwo) {
                                                money -= 0.1
                                                honor += 0.1
                                            }
                                            else if (chooser == " 3 " && !usedTwo) {
                                                honor += 0.1
                                                money += 0.1
                                            }
                                            else if (chooser == " 4 " && !usedTwo) {
                                                money += 0.1
                                                honor -= 0.15
                                            }
                                            showTwo = false
                                            usedTwo = true
                                        }.padding().background(RoundedRectangle(cornerRadius: 25).fill(Color.black)).foregroundStyle(Color.white).font(Font.custom("cour", size: 20))
                                    }
                                }
                            }.ignoresSafeArea()
                        }
                    }
                }
                Spacer()
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    MainView()
}
