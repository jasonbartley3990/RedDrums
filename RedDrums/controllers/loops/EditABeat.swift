//
//  EditABeat.swift
//  RedDrums
//
//  Created by Jason bartley on 12/9/21.
//

import SwiftUI

struct EditABeat: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var currentBar = "1"
    @State private var currentSubBar = "1"
    
    @State var beat: Beat?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    @State private var beat11: String = ""
    @State private var beat11Sec: String = ""
    @State private var beat11half: String = ""
    @State private var beat12: String = ""
    @State private var beat12Sec: String = ""
    @State private var beat12half: String = ""
    @State private var beat13: String = ""
    @State private var beat13Sec: String = ""
    @State private var beat13half: String = ""
    @State private var beat14: String = ""
    @State private var beat14Sec: String = ""
    @State private var beat14half: String = ""
    @State private var beat21: String = ""
    @State private var beat21Sec: String = ""
    @State private var beat21half: String = ""
    @State private var beat22: String = ""
    @State private var beat22Sec: String = ""
    @State private var beat22half: String = ""
    @State private var beat23: String = ""
    @State private var beat23Sec: String = ""
    @State private var beat23half: String = ""
    @State private var beat24: String = ""
    @State private var beat24Sec: String = ""
    @State private var beat24half: String = ""
    @State private var beat31: String = ""
    @State private var beat31Sec: String = ""
    @State private var beat31half: String = ""
    @State private var beat32: String = ""
    @State private var beat32Sec: String = ""
    @State private var beat32half: String = ""
    @State private var beat33: String = ""
    @State private var beat33Sec: String = ""
    @State private var beat33half: String = ""
    @State private var beat34: String = ""
    @State private var beat34Sec: String = ""
    @State private var beat34half: String = ""
    @State private var beat41: String = ""
    @State private var beat41Sec: String = ""
    @State private var beat41half: String = ""
    @State private var beat42: String = ""
    @State private var beat42Sec: String = ""
    @State private var beat42half: String = ""
    @State private var beat43: String = ""
    @State private var beat43Sec: String = ""
    @State private var beat43half: String = ""
    @State private var beat44: String = ""
    @State private var beat44Sec: String = ""
    @State private var beat44half: String = ""
    
    @State private var subBar1: String = ""
    @State private var subBar1Sec: String = ""
    @State private var subBar1half: String = ""
    @State private var subBar2: String = ""
    @State private var subBar2Sec: String = ""
    @State private var subBar2half: String = ""
    @State private var subBar3: String = ""
    @State private var subBar3Sec: String = ""
    @State private var subBar3half: String = ""
    @State private var subBar4: String = ""
    @State private var subBar4Sec: String = ""
    @State private var subBar4half: String = ""
    
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack {
                    Text("Select Note").foregroundColor(Color.white)
                    
                    Spacer()
                    
                    HStack {
                        HStack {
                            NavigationLink(destination: SelectedNoteEdit(bar: currentBar, subBar: "1", beat: beat, isHalf: false, showingWhichNote: true), label: {
                                VStack {
                                    line().stroke(Color.blue, lineWidth: 7).frame(width: geo.size.height * 0.1, height: geo.size.height * 0.35)
                                    
                                    HStack {
                                        Text(currentBar).foregroundColor(Color.white).font(.system(size: 20))
                                        Text("1").foregroundColor(Color.white).font(.system(size: 16))
                                        
                                    }
                                    
                                    Text(subBar1).foregroundColor(Color.red)
                                    Text(subBar1Sec).foregroundColor(Color.red)
                                }
                            })
                            
                            Spacer()
                            NavigationLink(destination: SelectedNoteEdit(bar: currentBar, subBar: "1", beat: beat, isHalf: true, showingWhichNote: false), label: {
                                
                                
                                VStack {
                                    line().stroke(Color.white, lineWidth: 5).frame(width: geo.size.height * 0.1, height: geo.size.height * 0.25)
                                    
                                    Text(subBar1half).foregroundColor(Color.red)
                                    
                                    Text("")
                                    
                                }
                            })
                            
                            
                            Spacer()
                            
                            NavigationLink(destination: SelectedNoteEdit(bar: currentBar, subBar: "2", beat: beat, isHalf: false, showingWhichNote: true), label: {
                                
                                
                                VStack {
                                    line().stroke(Color.white, lineWidth: 5).frame(width: geo.size.height * 0.1, height: geo.size.height * 0.3)
                                    
                                    HStack {
                                        Text(currentBar).foregroundColor(Color.white).font(.system(size: 20))
                                        Text("2").foregroundColor(Color.white).font(.system(size: 16))
                                        
                                    }
                                    
                                    Text(subBar2).foregroundColor(Color.red)
                                    
                                    Text(subBar2Sec).foregroundColor(Color.red)
                                }
                            })
                            
                            
                            Spacer()
                            
                            NavigationLink(destination: SelectedNoteEdit(bar: currentBar, subBar: "2", beat: beat, isHalf: true, showingWhichNote: false), label: {
                                
                                VStack {
                                    
                                    line().stroke(Color.white, lineWidth: 5).frame(width: geo.size.height * 0.1, height: geo.size.height * 0.25)
                                    
                                    Text(subBar2half).foregroundColor(Color.red)
                                    
                                    Text("")
                                }
                                
                            })
                            
                            Spacer()
                        }
                        
                        HStack {
                            
                            NavigationLink(destination: SelectedNoteEdit(bar: currentBar, subBar: "3", beat: beat, isHalf: false, showingWhichNote: true), label: {
                                
                                
                                VStack {
                                    line().stroke(Color.blue, lineWidth: 7).frame(width: geo.size.height * 0.1, height: geo.size.height * 0.35)
                                    
                                    HStack {
                                        Text(currentBar).foregroundColor(Color.white).font(.system(size: 20))
                                        Text("3").foregroundColor(Color.white).font(.system(size: 16))
                                    }
                                    
                                    Text(subBar3).foregroundColor(Color.red)
                                    
                                    Text(subBar3Sec).foregroundColor(Color.red)
                                }
                            })
                            
                            
                            Spacer()
                            
                            
                            NavigationLink(destination: SelectedNoteEdit(bar: currentBar, subBar: "3", beat: beat, isHalf: true, showingWhichNote: false), label: {
                                
                                
                                VStack {
                                    line().stroke(Color.white, lineWidth: 5).frame(width: geo.size.height * 0.1, height: geo.size.height * 0.25)
                                    
                                    Text(subBar3half).foregroundColor(Color.red)
                                    
                                    Text("")
                                    
                                }
                            })
                            
                            
                            Spacer()
                            
                            NavigationLink(destination: SelectedNoteEdit(bar: currentBar, subBar: "4", beat: beat, isHalf: false, showingWhichNote: true ), label: {
                                
                                
                                VStack {
                                    line().stroke(Color.white, lineWidth: 5).frame(width: geo.size.height * 0.1, height: geo.size.height * 0.3)
                                    
                                    HStack {
                                        Text(currentBar).foregroundColor(Color.white).font(.system(size: 20))
                                        Text("4").foregroundColor(Color.white).font(.system(size: 16))
                                    }
                                    
                                    Text(subBar4).foregroundColor(Color.red)
                                    
                                    Text(subBar4Sec).foregroundColor(Color.red)
                                }
                            })
                            
                            
                            Spacer()
                            
                            NavigationLink(destination: SelectedNoteEdit(bar: currentBar, subBar: "4", beat: beat, isHalf: true, showingWhichNote: false), label: {
                                            
                                            
                                            VStack {
                                                line().stroke(Color.white, lineWidth: 5).frame(width: geo.size.height * 0.1, height: geo.size.height * 0.25)
                                                
                                                Text(subBar4half).foregroundColor(Color.red)
                                                
                                                Text("")
                                                
                                            }})
                            
                            Spacer()
                            
                        }
                    }
                    
                    
                    
                    
                    
                    Spacer()
                    
                    HStack {
                        ZStack {
                            Circle().fill(Color.white).frame(width: 60, height: 60)
                            
                            Text("Back").foregroundColor(Color.blue)
                        }.onTapGesture {
                            HighTomPlayer.HighTom.playSound(sound: "hiTom1")
                            presentationMode.wrappedValue.dismiss()
                        }
                        
                        Spacer()
                        
                        HStack {
                            Image(systemName: "arrowtriangle.left.fill").resizable().foregroundColor(Color.white).frame(width: 35, height: 35).onTapGesture {
                                decrementBar()
                            }
                            Text("Bar").foregroundColor(Color.white).font(.system(size: 30))
                            Text(currentBar).foregroundColor(Color.white).font(.system(size: 30))
                            Image(systemName: "arrowtriangle.right.fill").resizable().foregroundColor(Color.white).frame(width: 35, height: 35).onTapGesture {
                                incrementBar()
                            }
                        }
                        
                        
                        Spacer()
                        
                        ZStack {
                            Circle().fill(Color.white).frame(width: 60, height: 60)
                            
                            Text("save").foregroundColor(Color.blue)
                        }.onTapGesture {
                            HighTomPlayer.HighTom.playSound(sound: "hiTom1")
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
                
            }.onAppear(perform: setNoteNames)
        }
        
    }
    
    func incrementBar() {
        
        if currentBar == "3" {
            currentBar = "4"
        }
        
        if currentBar == "2" {
            currentBar = "3"
        }
        
        if currentBar == "1" {
            currentBar = "2"
        }
        
        setNoteNames()
        
    }
    
    func decrementBar() {
        if currentBar == "2" {
            currentBar = "1"
        }
        if currentBar == "3" {
            currentBar = "2"
        }
        
        if currentBar == "4" {
            currentBar = "3"
        }
        
        setNoteNames()
    }
    
    
    private func noteNamesForbar() {
        if currentBar == "1" {
            subBar1 = beat11
            subBar1Sec = beat11Sec
            subBar1half = beat11half
            subBar2 = beat12
            subBar2Sec = beat12Sec
            subBar2half = beat12half
            subBar3 = beat13
            subBar3Sec = beat13Sec
            subBar3half = beat13half
            subBar4 = beat14
            subBar4Sec = beat14Sec
            subBar4half = beat14half
        }
        
        if currentBar == "2" {
            subBar1 = beat21
            subBar1Sec = beat21Sec
            subBar1half = beat21half
            subBar2 = beat22
            subBar2Sec = beat22Sec
            subBar2half = beat22half
            subBar3 = beat23
            subBar3Sec = beat23Sec
            subBar3half = beat23half
            subBar4 = beat24
            subBar4Sec = beat24Sec
            subBar4half = beat24half
            
        }
        
        if currentBar == "3" {
            subBar1 = beat31
            subBar1Sec = beat31Sec
            subBar1half = beat31half
            subBar2 = beat32
            subBar2Sec = beat32Sec
            subBar2half = beat32half
            subBar3 = beat33
            subBar3Sec = beat33Sec
            subBar3half = beat33half
            subBar4 = beat34
            subBar4Sec = beat34Sec
            subBar4half = beat34half
            
        }
        
        if currentBar == "4" {
            subBar1 = beat41
            subBar1Sec = beat41Sec
            subBar1half = beat41half
            subBar2 = beat42
            subBar2Sec = beat42Sec
            subBar2half = beat42half
            subBar3 = beat43
            subBar3Sec = beat43Sec
            subBar3half = beat43half
            subBar4 = beat44
            subBar4Sec = beat44Sec
            subBar4half = beat44half
        }
    }
    
    private func setNoteNames() {
        let drumItem1 = beat?.beat11First
        
        if drumItem1 == instrumentStrings.kickString {
            beat11 = "K"
        } else if drumItem1 == instrumentStrings.snareString {
            beat11 = "S"
        } else if drumItem1 == instrumentStrings.rimshotString {
            beat11 = "RS"
        } else if drumItem1 == instrumentStrings.sidestickString {
            beat11 = "SS"
        } else if drumItem1 == instrumentStrings.hhCloseString {
            beat11 = "HHC"
        } else if drumItem1 == instrumentStrings.hhOpenString {
            beat11 = "HHO"
        } else if drumItem1 == instrumentStrings.hiTomString {
            beat11 = "HT"
        } else if drumItem1 == instrumentStrings.midTomString {
            beat11 = "MT"
        } else if drumItem1 == instrumentStrings.lowTomString {
            beat11 = "LT"
        } else if drumItem1 == instrumentStrings.crashString {
            beat11 = "C"
        } else if drumItem1 == instrumentStrings.rideString {
            beat11 = "RD"
        } else if drumItem1 == instrumentStrings.random1String {
            beat11 = "OT"
        } else if  drumItem1 == instrumentStrings.random2String {
            beat11 = "OT2"
        }
        
        
        
        let drumItem2 = beat?.beat11Second
        
        if drumItem2 == instrumentStrings.kickString {
            beat11Sec = "K"
        } else if drumItem2 == instrumentStrings.snareString {
            beat11Sec = "S"
        } else if drumItem2 == instrumentStrings.rimshotString {
            beat11Sec = "RS"
        } else if drumItem2 == instrumentStrings.sidestickString {
            beat11Sec = "SS"
        } else if drumItem2 == instrumentStrings.hhCloseString {
            beat11Sec = "HHC"
        } else if drumItem2 == instrumentStrings.hhOpenString {
            beat11Sec = "HHO"
        } else if drumItem2 == instrumentStrings.hiTomString {
            beat11Sec = "HT"
        } else if drumItem2 == instrumentStrings.midTomString {
            beat11Sec = "MT"
        } else if drumItem2 == instrumentStrings.lowTomString {
            beat11Sec = "LT"
        } else if drumItem2 == instrumentStrings.crashString {
            beat11Sec = "C"
        } else if drumItem2 == instrumentStrings.rideString {
            beat11Sec = "RD"
        } else if drumItem2 == instrumentStrings.random1String {
            beat11Sec = "OT"
        } else if  drumItem2 == instrumentStrings.random2String {
            beat11Sec = "OT2"
        }
        
        
        
        let drumItem3 = beat?.beat11Half
        
        if drumItem3 == instrumentStrings.kickString {
            beat11half = "K"
        } else if drumItem3 == instrumentStrings.snareString {
            beat11half = "S"
        } else if drumItem3 == instrumentStrings.rimshotString {
            beat11half = "RS"
        } else if drumItem3 == instrumentStrings.sidestickString {
            beat11half = "SS"
        } else if drumItem3 == instrumentStrings.hhCloseString {
            beat11half = "HHC"
        } else if drumItem3 == instrumentStrings.hhOpenString {
            beat11half = "HHO"
        } else if drumItem3 == instrumentStrings.hiTomString {
            beat11half = "HT"
        } else if drumItem3 == instrumentStrings.midTomString {
            beat11half = "MT"
        } else if drumItem3 == instrumentStrings.lowTomString {
            beat11half = "LT"
        } else if drumItem3 == instrumentStrings.crashString {
            beat11half = "C"
        } else if drumItem3 == instrumentStrings.rideString {
            beat11half = "RD"
        } else if drumItem3 == instrumentStrings.random1String {
            beat11half = "OT"
        } else if  drumItem3 == instrumentStrings.random2String {
            beat11half = "OT2"
        }
        
        
        
        let drumItem4 = beat?.beat12First
        
        if drumItem4 == instrumentStrings.kickString {
            beat12 = "K"
        } else if drumItem4 == instrumentStrings.snareString {
            beat12 = "S"
        } else if drumItem4 == instrumentStrings.rimshotString {
            beat12 = "RS"
        } else if drumItem4 == instrumentStrings.sidestickString {
            beat12 = "SS"
        } else if drumItem4 == instrumentStrings.hhCloseString {
            beat12 = "HHC"
        } else if drumItem4 == instrumentStrings.hhOpenString {
            beat12 = "HHO"
        } else if drumItem4 == instrumentStrings.hiTomString {
            beat12 = "HT"
        } else if drumItem4 == instrumentStrings.midTomString {
            beat12 = "MT"
        } else if drumItem4 == instrumentStrings.lowTomString {
            beat12 = "LT"
        } else if drumItem4 == instrumentStrings.crashString {
            beat12 = "C"
        } else if drumItem4 == instrumentStrings.rideString {
            beat12 = "RD"
        } else if drumItem4 == instrumentStrings.random1String {
            beat12 = "OT"
        } else if  drumItem4 == instrumentStrings.random2String {
            beat12 = "OT2"
        }
        
        
        
        
        let drumItem5 = beat?.beat12Second
        
        if drumItem5 == instrumentStrings.kickString {
            beat12Sec = "K"
        } else if drumItem5 == instrumentStrings.snareString {
            beat12Sec = "S"
        } else if drumItem5 == instrumentStrings.rimshotString {
            beat12Sec = "RS"
        } else if drumItem5 == instrumentStrings.sidestickString {
            beat12Sec = "SS"
        } else if drumItem5 == instrumentStrings.hhCloseString {
            beat12Sec = "HHC"
        } else if drumItem5 == instrumentStrings.hhOpenString {
            beat12Sec = "HHO"
        } else if drumItem5 == instrumentStrings.hiTomString {
            beat12Sec = "HT"
        } else if drumItem5 == instrumentStrings.midTomString {
            beat12Sec = "MT"
        } else if drumItem5 == instrumentStrings.lowTomString {
            beat12Sec = "LT"
        } else if drumItem5 == instrumentStrings.crashString {
            beat12Sec = "C"
        } else if drumItem5 == instrumentStrings.rideString {
            beat12Sec = "RD"
        } else if drumItem5 == instrumentStrings.random1String {
            beat12Sec = "OT"
        } else if  drumItem5 == instrumentStrings.random2String {
            beat12Sec = "OT2"
        }
        
        
        
        
        let drumItem6 = beat?.beat12Half
        
        if drumItem6 == instrumentStrings.kickString {
            beat12half = "K"
        } else if drumItem6 == instrumentStrings.snareString {
            beat12half = "S"
        } else if drumItem6 == instrumentStrings.rimshotString {
            beat12half = "RS"
        } else if drumItem6 == instrumentStrings.sidestickString {
            beat12half = "SS"
        } else if drumItem6 == instrumentStrings.hhCloseString {
            beat12half = "HHC"
        } else if drumItem6 == instrumentStrings.hhOpenString {
            beat12half = "HHO"
        } else if drumItem6 == instrumentStrings.hiTomString {
            beat12half = "HT"
        } else if drumItem6 == instrumentStrings.midTomString {
            beat12half = "MT"
        } else if drumItem6 == instrumentStrings.lowTomString {
            beat12half = "LT"
        } else if drumItem6 == instrumentStrings.crashString {
            beat12half = "C"
        } else if drumItem6 == instrumentStrings.rideString {
            beat12half = "RD"
        } else if drumItem6 == instrumentStrings.random1String {
            beat12half = "OT"
        } else if  drumItem6 == instrumentStrings.random2String {
            beat12half = "OT2"
        }
        
        
            
        
        
        
        let drumItem7 = beat?.beat13First
        
        if drumItem7 == instrumentStrings.kickString {
            beat13 = "K"
        } else if drumItem7 == instrumentStrings.snareString {
            beat13 = "S"
        } else if drumItem7 == instrumentStrings.rimshotString {
            beat13 = "RS"
        } else if drumItem7 == instrumentStrings.sidestickString {
            beat13 = "SS"
        } else if drumItem7 == instrumentStrings.hhCloseString {
            beat13 = "HHC"
        } else if drumItem7 == instrumentStrings.hhOpenString {
            beat13 = "HHO"
        } else if drumItem7 == instrumentStrings.hiTomString {
            beat13 = "HT"
        } else if drumItem7 == instrumentStrings.midTomString {
            beat13 = "MT"
        } else if drumItem7 == instrumentStrings.lowTomString {
            beat13 = "LT"
        } else if drumItem7 == instrumentStrings.crashString {
            beat13 = "C"
        } else if drumItem7 == instrumentStrings.rideString {
            beat13 = "RD"
        } else if drumItem7 == instrumentStrings.random1String {
            beat13 = "OT"
        } else if  drumItem7 == instrumentStrings.random2String {
            beat13 = "OT2"
        }
        
        
        
        
        let drumItem8 = beat?.beat13Second
        
        if drumItem8 == instrumentStrings.kickString {
            beat13Sec = "K"
        } else if drumItem8 == instrumentStrings.snareString {
            beat13Sec = "S"
        } else if drumItem8 == instrumentStrings.rimshotString {
            beat13Sec = "RS"
        } else if drumItem8 == instrumentStrings.sidestickString {
            beat13Sec = "SS"
        } else if drumItem8 == instrumentStrings.hhCloseString {
            beat13Sec = "HHC"
        } else if drumItem8 == instrumentStrings.hhOpenString {
            beat13Sec = "HHO"
        } else if drumItem8 == instrumentStrings.hiTomString {
            beat13Sec = "HT"
        } else if drumItem8 == instrumentStrings.midTomString {
            beat13Sec = "MT"
        } else if drumItem8 == instrumentStrings.lowTomString {
            beat13Sec = "LT"
        } else if drumItem8 == instrumentStrings.crashString {
            beat13Sec = "C"
        } else if drumItem8 == instrumentStrings.rideString {
            beat13Sec = "RD"
        } else if drumItem8 == instrumentStrings.random1String {
            beat13Sec = "OT"
        } else if  drumItem8 == instrumentStrings.random2String {
            beat13Sec = "OT2"
        }
        
        
        
        
        let drumItem9 = beat?.beat13Half
        
        if drumItem9 == instrumentStrings.kickString {
            beat13half = "K"
        } else if drumItem9 == instrumentStrings.snareString {
            beat13half = "S"
        } else if drumItem9 == instrumentStrings.rimshotString {
            beat13half = "RS"
        } else if drumItem9 == instrumentStrings.sidestickString {
            beat13half = "SS"
        } else if drumItem9 == instrumentStrings.hhCloseString {
            beat13half = "HHC"
        } else if drumItem9 == instrumentStrings.hhOpenString {
            beat13half = "HHO"
        } else if drumItem9 == instrumentStrings.hiTomString {
            beat13half = "HT"
        } else if drumItem9 == instrumentStrings.midTomString {
            beat13half = "MT"
        } else if drumItem9 == instrumentStrings.lowTomString {
            beat13half = "LT"
        } else if drumItem9 == instrumentStrings.crashString {
            beat13half = "C"
        } else if drumItem9 == instrumentStrings.rideString {
            beat13half = "RD"
        } else if drumItem9 == instrumentStrings.random1String {
            beat13half = "OT"
        } else if  drumItem9 == instrumentStrings.random2String {
            beat13half = "OT2"
        }
        
        
        
        
        let drumItem10 = beat?.beat14First
        
        if drumItem10 == instrumentStrings.kickString {
            beat14 = "K"
        } else if drumItem10 == instrumentStrings.snareString {
            beat14 = "S"
        } else if drumItem10 == instrumentStrings.rimshotString {
            beat14 = "RS"
        } else if drumItem10 == instrumentStrings.sidestickString {
            beat14 = "SS"
        } else if drumItem10 == instrumentStrings.hhCloseString {
            beat14 = "HHC"
        } else if drumItem10 == instrumentStrings.hhOpenString {
            beat14 = "HHO"
        } else if drumItem10 == instrumentStrings.hiTomString {
            beat14 = "HT"
        } else if drumItem10 == instrumentStrings.midTomString {
            beat14 = "MT"
        } else if drumItem10 == instrumentStrings.lowTomString {
            beat14 = "LT"
        } else if drumItem10 == instrumentStrings.crashString {
            beat14 = "C"
        } else if drumItem10 == instrumentStrings.rideString {
            beat14 = "RD"
        } else if drumItem10 == instrumentStrings.random1String {
            beat14 = "OT"
        } else if  drumItem10 == instrumentStrings.random2String {
            beat14 = "OT2"
        }
        
        
        
        
        let drumItem11 = beat?.beat14Second
        
        if drumItem11 == instrumentStrings.kickString {
            beat14Sec = "K"
        } else if drumItem11 == instrumentStrings.snareString {
            beat14Sec = "S"
        } else if drumItem11 == instrumentStrings.rimshotString {
            beat14Sec = "RS"
        } else if drumItem11 == instrumentStrings.sidestickString {
            beat14Sec = "SS"
        } else if drumItem11 == instrumentStrings.hhCloseString {
            beat14Sec = "HHC"
        } else if drumItem11 == instrumentStrings.hhOpenString {
            beat14Sec = "HHO"
        } else if drumItem11 == instrumentStrings.hiTomString {
            beat14Sec = "HT"
        } else if drumItem11 == instrumentStrings.midTomString {
            beat14Sec = "MT"
        } else if drumItem11 == instrumentStrings.lowTomString {
            beat14Sec = "LT"
        } else if drumItem11 == instrumentStrings.crashString {
            beat14Sec = "C"
        } else if drumItem11 == instrumentStrings.rideString {
            beat14Sec = "RD"
        } else if drumItem11 == instrumentStrings.random1String {
            beat14Sec = "OT"
        } else if  drumItem11 == instrumentStrings.random2String {
            beat14Sec = "OT2"
        }
        
        
        
        let drumItem12 = beat?.beat14Half
        
        if drumItem12 == instrumentStrings.kickString {
            beat14half = "K"
        } else if drumItem12 == instrumentStrings.snareString {
            beat14half = "S"
        } else if drumItem12 == instrumentStrings.rimshotString {
            beat14half = "RS"
        } else if drumItem12 == instrumentStrings.sidestickString {
            beat14half = "SS"
        } else if drumItem12 == instrumentStrings.hhCloseString {
            beat14half = "HHC"
        } else if drumItem12 == instrumentStrings.hhOpenString {
            beat14half = "HHO"
        } else if drumItem12 == instrumentStrings.hiTomString {
            beat14half = "HT"
        } else if drumItem12 == instrumentStrings.midTomString {
            beat14half = "MT"
        } else if drumItem12 == instrumentStrings.lowTomString {
            beat14half = "LT"
        } else if drumItem12 == instrumentStrings.crashString {
            beat14half = "C"
        } else if drumItem12 == instrumentStrings.rideString {
            beat14half = "RD"
        } else if drumItem12 == instrumentStrings.random1String {
            beat14half = "OT"
        } else if  drumItem12 == instrumentStrings.random2String {
            beat14half = "OT2"
        }
        
        
        let drumItem13 = beat?.beat21First
        
        if drumItem13 == instrumentStrings.kickString {
            beat21 = "K"
        } else if drumItem13 == instrumentStrings.snareString {
            beat21 = "S"
        } else if drumItem13 == instrumentStrings.rimshotString {
            beat21 = "RS"
        } else if drumItem13 == instrumentStrings.sidestickString {
            beat21 = "SS"
        } else if drumItem13 == instrumentStrings.hhCloseString {
            beat21 = "HHC"
        } else if drumItem13 == instrumentStrings.hhOpenString {
            beat21 = "HHO"
        } else if drumItem13 == instrumentStrings.hiTomString {
            beat21 = "HT"
        } else if drumItem13 == instrumentStrings.midTomString {
            beat21 = "MT"
        } else if drumItem13 == instrumentStrings.lowTomString {
            beat21 = "LT"
        } else if drumItem13 == instrumentStrings.crashString {
            beat21 = "C"
        } else if drumItem13 == instrumentStrings.rideString {
            beat21 = "RD"
        } else if drumItem13 == instrumentStrings.random1String {
            beat21 = "OT"
        } else if  drumItem13 == instrumentStrings.random2String {
            beat21 = "OT2"
        }
        
        
        let drumItem14 = beat?.beat21Second
        
        if drumItem14 == instrumentStrings.kickString {
            beat21Sec = "K"
        } else if drumItem14 == instrumentStrings.snareString {
            beat21Sec = "S"
        } else if drumItem14 == instrumentStrings.rimshotString {
            beat21Sec = "RS"
        } else if drumItem14 == instrumentStrings.sidestickString {
            beat21Sec = "SS"
        } else if drumItem14 == instrumentStrings.hhCloseString {
            beat21Sec = "HHC"
        } else if drumItem14 == instrumentStrings.hhOpenString {
            beat21Sec = "HHO"
        } else if drumItem14 == instrumentStrings.hiTomString {
            beat21Sec = "HT"
        } else if drumItem14 == instrumentStrings.midTomString {
            beat21Sec = "MT"
        } else if drumItem14 == instrumentStrings.lowTomString {
            beat21Sec = "LT"
        } else if drumItem14 == instrumentStrings.crashString {
            beat21Sec = "C"
        } else if drumItem14 == instrumentStrings.rideString {
            beat21Sec = "RD"
        } else if drumItem14 == instrumentStrings.random1String {
            beat21Sec = "OT"
        } else if  drumItem14 == instrumentStrings.random2String {
            beat21Sec = "OT2"
        }
        
        
        
        
        let drumItem15 = beat?.beat21Half
        
        if drumItem15 == instrumentStrings.kickString {
            beat21half = "K"
        } else if drumItem15 == instrumentStrings.snareString {
            beat21half = "S"
        } else if drumItem15 == instrumentStrings.rimshotString {
            beat21half = "RS"
        } else if drumItem15 == instrumentStrings.sidestickString {
            beat21half = "SS"
        } else if drumItem15 == instrumentStrings.hhCloseString {
            beat21half = "HHC"
        } else if drumItem15 == instrumentStrings.hhOpenString {
            beat21half = "HHO"
        } else if drumItem15 == instrumentStrings.hiTomString {
            beat21half = "HT"
        } else if drumItem15 == instrumentStrings.midTomString {
            beat21half = "MT"
        } else if drumItem15 == instrumentStrings.lowTomString {
            beat21half = "LT"
        } else if drumItem15 == instrumentStrings.crashString {
            beat21half = "C"
        } else if drumItem15 == instrumentStrings.rideString {
            beat21half = "RD"
        } else if drumItem15 == instrumentStrings.random1String {
            beat21half = "OT"
        } else if  drumItem15 == instrumentStrings.random2String {
            beat21half = "OT2"
        }
            
        
        
        
        let drumItem16 = beat?.beat22First
        
        if drumItem16 == instrumentStrings.kickString {
            beat22 = "K"
        } else if drumItem16 == instrumentStrings.snareString {
            beat22 = "S"
        } else if drumItem16 == instrumentStrings.rimshotString {
            beat22 = "RS"
        } else if drumItem16 == instrumentStrings.sidestickString {
            beat22 = "SS"
        } else if drumItem16 == instrumentStrings.hhCloseString {
            beat22 = "HHC"
        } else if drumItem16 == instrumentStrings.hhOpenString {
            beat22 = "HHO"
        } else if drumItem16 == instrumentStrings.hiTomString {
            beat22 = "HT"
        } else if drumItem16 == instrumentStrings.midTomString {
            beat22 = "MT"
        } else if drumItem16 == instrumentStrings.lowTomString {
            beat22 = "LT"
        } else if drumItem16 == instrumentStrings.crashString {
            beat22 = "C"
        } else if drumItem16 == instrumentStrings.rideString {
            beat22 = "RD"
        } else if drumItem16 == instrumentStrings.random1String {
            beat22 = "OT"
        } else if  drumItem16 == instrumentStrings.random2String {
            beat22 = "OT2"
        }
        
        
        let drumItem17 = beat?.beat22Second
        
        if drumItem17 == instrumentStrings.kickString {
            beat22Sec = "K"
        } else if drumItem17 == instrumentStrings.snareString {
            beat22Sec = "S"
        } else if drumItem17 == instrumentStrings.rimshotString {
            beat22Sec = "RS"
        } else if drumItem17 == instrumentStrings.sidestickString {
            beat22Sec = "SS"
        } else if drumItem17 == instrumentStrings.hhCloseString {
            beat22Sec = "HHC"
        } else if drumItem17 == instrumentStrings.hhOpenString {
            beat22Sec = "HHO"
        } else if drumItem17 == instrumentStrings.hiTomString {
            beat22Sec = "HT"
        } else if drumItem17 == instrumentStrings.midTomString {
            beat22Sec = "MT"
        } else if drumItem17 == instrumentStrings.lowTomString {
            beat22Sec = "LT"
        } else if drumItem17 == instrumentStrings.crashString {
            beat22Sec = "C"
        } else if drumItem17 == instrumentStrings.rideString {
            beat22Sec = "RD"
        } else if drumItem17 == instrumentStrings.random1String {
            beat22Sec = "OT"
        } else if  drumItem17 == instrumentStrings.random2String {
            beat22Sec = "OT2"
        }
        
        
        
        
        let drumItem18 = beat?.beat22Half
        
        if drumItem18 == instrumentStrings.kickString {
            beat22half = "K"
        } else if drumItem18 == instrumentStrings.snareString {
            beat22half = "S"
        } else if drumItem18 == instrumentStrings.rimshotString {
            beat22half = "RS"
        } else if drumItem18 == instrumentStrings.sidestickString {
            beat22half = "SS"
        } else if drumItem18 == instrumentStrings.hhCloseString {
            beat22half = "HHC"
        } else if drumItem18 == instrumentStrings.hhOpenString {
            beat22half = "HHO"
        } else if drumItem18 == instrumentStrings.hiTomString {
            beat22half = "HT"
        } else if drumItem18 == instrumentStrings.midTomString {
            beat22half = "MT"
        } else if drumItem18 == instrumentStrings.lowTomString {
            beat22half = "LT"
        } else if drumItem18 == instrumentStrings.crashString {
            beat22half = "C"
        } else if drumItem18 == instrumentStrings.rideString {
            beat22half = "RD"
        } else if drumItem18 == instrumentStrings.random1String {
            beat22half = "OT"
        } else if  drumItem18 == instrumentStrings.random2String {
            beat22half = "OT2"
        }
        
        
        let drumItem19 = beat?.beat23First
        
        if drumItem19 == instrumentStrings.kickString {
            beat23 = "K"
        } else if drumItem19 == instrumentStrings.snareString {
            beat23 = "S"
        } else if drumItem19 == instrumentStrings.rimshotString {
            beat23 = "RS"
        } else if drumItem19 == instrumentStrings.sidestickString {
            beat23 = "SS"
        } else if drumItem19 == instrumentStrings.hhCloseString {
            beat23 = "HHC"
        } else if drumItem19 == instrumentStrings.hhOpenString {
            beat23 = "HHO"
        } else if drumItem19 == instrumentStrings.hiTomString {
            beat23 = "HT"
        } else if drumItem19 == instrumentStrings.midTomString {
            beat23 = "MT"
        } else if drumItem19 == instrumentStrings.lowTomString {
            beat23 = "LT"
        } else if drumItem19 == instrumentStrings.crashString {
            beat23 = "C"
        } else if drumItem19 == instrumentStrings.rideString {
            beat23 = "RD"
        } else if drumItem19 == instrumentStrings.random1String {
            beat23 = "OT"
        } else if  drumItem19 == instrumentStrings.random2String {
            beat23 = "OT2"
        }
        
        
        
        let drumItem20 = beat?.beat23Second
        
        if drumItem20 == instrumentStrings.kickString {
            beat23Sec = "K"
        } else if drumItem20 == instrumentStrings.snareString {
            beat23Sec = "S"
        } else if drumItem20 == instrumentStrings.rimshotString {
            beat23Sec = "RS"
        } else if drumItem20 == instrumentStrings.sidestickString {
            beat23Sec = "SS"
        } else if drumItem20 == instrumentStrings.hhCloseString {
            beat23Sec = "HHC"
        } else if drumItem20 == instrumentStrings.hhOpenString {
            beat23Sec = "HHO"
        } else if drumItem20 == instrumentStrings.hiTomString {
            beat23Sec = "HT"
        } else if drumItem20 == instrumentStrings.midTomString {
            beat23Sec = "MT"
        } else if drumItem20 == instrumentStrings.lowTomString {
            beat23Sec = "LT"
        } else if drumItem20 == instrumentStrings.crashString {
            beat23Sec = "C"
        } else if drumItem20 == instrumentStrings.rideString {
            beat23Sec = "RD"
        } else if drumItem20 == instrumentStrings.random1String {
            beat23Sec = "OT"
        } else if  drumItem20 == instrumentStrings.random2String {
            beat23Sec = "OT2"
        }
        
       
        let drumItem21 = beat?.beat23Half
        
        if drumItem21 == instrumentStrings.kickString {
            beat23half = "K"
        } else if drumItem21 == instrumentStrings.snareString {
            beat23half = "S"
        } else if drumItem21 == instrumentStrings.rimshotString {
            beat23half = "RS"
        } else if drumItem21 == instrumentStrings.sidestickString {
            beat23half = "SS"
        } else if drumItem21 == instrumentStrings.hhCloseString {
            beat23half = "HHC"
        } else if drumItem21 == instrumentStrings.hhOpenString {
            beat23half = "HHO"
        } else if drumItem21 == instrumentStrings.hiTomString {
            beat23half = "HT"
        } else if drumItem21 == instrumentStrings.midTomString {
            beat23half = "MT"
        } else if drumItem21 == instrumentStrings.lowTomString {
            beat23half = "LT"
        } else if drumItem21 == instrumentStrings.crashString {
            beat23half = "C"
        } else if drumItem21 == instrumentStrings.rideString {
            beat23half = "RD"
        } else if drumItem21 == instrumentStrings.random1String {
            beat23half = "OT"
        } else if  drumItem21 == instrumentStrings.random2String {
            beat23half = "OT2"
        }
        
        
        let drumItem22 = beat?.beat24First
        
        if drumItem22 == instrumentStrings.kickString {
            beat24 = "K"
        } else if drumItem22 == instrumentStrings.snareString {
            beat24 = "S"
        } else if drumItem22 == instrumentStrings.rimshotString {
            beat24 = "RS"
        } else if drumItem22 == instrumentStrings.sidestickString {
            beat24 = "SS"
        } else if drumItem22 == instrumentStrings.hhCloseString {
            beat24 = "HHC"
        } else if drumItem22 == instrumentStrings.hhOpenString {
            beat24 = "HHO"
        } else if drumItem22 == instrumentStrings.hiTomString {
            beat24 = "HT"
        } else if drumItem22 == instrumentStrings.midTomString {
            beat24 = "MT"
        } else if drumItem22 == instrumentStrings.lowTomString {
            beat24 = "LT"
        } else if drumItem22 == instrumentStrings.crashString {
            beat24 = "C"
        } else if drumItem22 == instrumentStrings.rideString {
            beat24 = "RD"
        } else if drumItem22 == instrumentStrings.random1String {
            beat24 = "OT"
        } else if  drumItem22 == instrumentStrings.random2String {
            beat24 = "OT2"
        }
        
        
        
        let drumItem23 = beat?.beat24Second
        
        if drumItem23 == instrumentStrings.kickString {
            beat24Sec = "K"
        } else if drumItem23 == instrumentStrings.snareString {
            beat24Sec = "S"
        } else if drumItem23 == instrumentStrings.rimshotString {
            beat24Sec = "RS"
        } else if drumItem23 == instrumentStrings.sidestickString {
            beat24Sec = "SS"
        } else if drumItem23 == instrumentStrings.hhCloseString {
            beat24Sec = "HHC"
        } else if drumItem23 == instrumentStrings.hhOpenString {
            beat24Sec = "HHO"
        } else if drumItem23 == instrumentStrings.hiTomString {
            beat24Sec = "HT"
        } else if drumItem23 == instrumentStrings.midTomString {
            beat24Sec = "MT"
        } else if drumItem23 == instrumentStrings.lowTomString {
            beat24Sec = "LT"
        } else if drumItem23 == instrumentStrings.crashString {
            beat24Sec = "C"
        } else if drumItem23 == instrumentStrings.rideString {
            beat24Sec = "RD"
        } else if drumItem23 == instrumentStrings.random1String {
            beat24Sec = "OT"
        } else if  drumItem23 == instrumentStrings.random2String {
            beat24Sec = "OT2"
        }
        
        
        
        
        let drumItem24 = beat?.beat24Half
        
        if drumItem24 == instrumentStrings.kickString {
            beat24half = "K"
        } else if drumItem24 == instrumentStrings.snareString {
            beat24half = "S"
        } else if drumItem24 == instrumentStrings.rimshotString {
            beat24half = "RS"
        } else if drumItem24 == instrumentStrings.sidestickString {
            beat24half = "SS"
        } else if drumItem24 == instrumentStrings.hhCloseString {
            beat24half = "HHC"
        } else if drumItem24 == instrumentStrings.hhOpenString {
            beat24half = "HHO"
        } else if drumItem24 == instrumentStrings.hiTomString {
            beat24half = "HT"
        } else if drumItem24 == instrumentStrings.midTomString {
            beat24half = "MT"
        } else if drumItem24 == instrumentStrings.lowTomString {
            beat24half = "LT"
        } else if drumItem24 == instrumentStrings.crashString {
            beat24half = "C"
        } else if drumItem24 == instrumentStrings.rideString {
            beat24half = "RD"
        } else if drumItem24 == instrumentStrings.random1String {
            beat24half = "OT"
        } else if  drumItem24 == instrumentStrings.random2String {
            beat24half = "OT2"
        }
        
        
        
        let drumItem25 = beat?.beat31First
        
        if drumItem25 == instrumentStrings.kickString {
            beat31 = "K"
        } else if drumItem22 == instrumentStrings.snareString {
            beat31 = "S"
        } else if drumItem22 == instrumentStrings.rimshotString {
            beat31 = "RS"
        } else if drumItem22 == instrumentStrings.sidestickString {
            beat31 = "SS"
        } else if drumItem22 == instrumentStrings.hhCloseString {
            beat31 = "HHC"
        } else if drumItem22 == instrumentStrings.hhOpenString {
            beat31 = "HHO"
        } else if drumItem22 == instrumentStrings.hiTomString {
            beat31 = "HT"
        } else if drumItem22 == instrumentStrings.midTomString {
            beat31 = "MT"
        } else if drumItem22 == instrumentStrings.lowTomString {
            beat31 = "LT"
        } else if drumItem22 == instrumentStrings.crashString {
            beat31 = "C"
        } else if drumItem22 == instrumentStrings.rideString {
            beat31 = "RD"
        } else if drumItem22 == instrumentStrings.random1String {
            beat31 = "OT"
        } else if  drumItem22 == instrumentStrings.random2String {
            beat31 = "OT2"
        }
        
        
        
        
        let drumItem26 = beat?.beat31Second
        
        if drumItem26 == instrumentStrings.kickString {
            beat31Sec = "K"
        } else if drumItem26 == instrumentStrings.snareString {
            beat31Sec = "S"
        } else if drumItem26 == instrumentStrings.rimshotString {
            beat31Sec = "RS"
        } else if drumItem26 == instrumentStrings.sidestickString {
            beat31Sec = "SS"
        } else if drumItem26 == instrumentStrings.hhCloseString {
            beat31Sec = "HHC"
        } else if drumItem26 == instrumentStrings.hhOpenString {
            beat31Sec = "HHO"
        } else if drumItem26 == instrumentStrings.hiTomString {
            beat31Sec = "HT"
        } else if drumItem26 == instrumentStrings.midTomString {
            beat31Sec = "MT"
        } else if drumItem26 == instrumentStrings.lowTomString {
            beat31Sec = "LT"
        } else if drumItem26 == instrumentStrings.crashString {
            beat31Sec = "C"
        } else if drumItem26 == instrumentStrings.rideString {
            beat31Sec = "RD"
        } else if drumItem26 == instrumentStrings.random1String {
            beat31Sec = "OT"
        } else if  drumItem26 == instrumentStrings.random2String {
            beat31Sec = "OT2"
        }
        
        
        
        let drumItem27 = beat?.beat31half
        
        if drumItem27 == instrumentStrings.kickString {
            beat31half = "K"
        } else if drumItem27 == instrumentStrings.snareString {
            beat31half = "S"
        } else if drumItem27 == instrumentStrings.rimshotString {
            beat31half = "RS"
        } else if drumItem27 == instrumentStrings.sidestickString {
            beat31half = "SS"
        } else if drumItem27 == instrumentStrings.hhCloseString {
            beat31half = "HHC"
        } else if drumItem27 == instrumentStrings.hhOpenString {
            beat31half = "HHO"
        } else if drumItem27 == instrumentStrings.hiTomString {
            beat31half = "HT"
        } else if drumItem27 == instrumentStrings.midTomString {
            beat31half = "MT"
        } else if drumItem27 == instrumentStrings.lowTomString {
            beat31half = "LT"
        } else if drumItem27 == instrumentStrings.crashString {
            beat31half = "C"
        } else if drumItem27 == instrumentStrings.rideString {
            beat31half = "RD"
        } else if drumItem27 == instrumentStrings.random1String {
            beat31half = "OT"
        } else if  drumItem27 == instrumentStrings.random2String {
            beat31half = "OT2"
        }
        
        
        let drumItem28 = beat?.beat32First
        
        if drumItem28 == instrumentStrings.kickString {
            beat32 = "K"
        } else if drumItem28 == instrumentStrings.snareString {
            beat32 = "S"
        } else if drumItem28 == instrumentStrings.rimshotString {
            beat32 = "RS"
        } else if drumItem28 == instrumentStrings.sidestickString {
            beat32 = "SS"
        } else if drumItem28 == instrumentStrings.hhCloseString {
            beat32 = "HHC"
        } else if drumItem28 == instrumentStrings.hhOpenString {
            beat32 = "HHO"
        } else if drumItem28 == instrumentStrings.hiTomString {
            beat32 = "HT"
        } else if drumItem28 == instrumentStrings.midTomString {
            beat32 = "MT"
        } else if drumItem28 == instrumentStrings.lowTomString {
            beat32 = "LT"
        } else if drumItem28 == instrumentStrings.crashString {
            beat32 = "C"
        } else if drumItem28 == instrumentStrings.rideString {
            beat32 = "RD"
        } else if drumItem28 == instrumentStrings.random1String {
            beat32 = "OT"
        } else if  drumItem28 == instrumentStrings.random2String {
            beat32 = "OT2"
        }
        
        
        let drumItem29 = beat?.beat32Second
        
        
        if drumItem29 == instrumentStrings.kickString {
            beat32Sec = "K"
        } else if drumItem29 == instrumentStrings.snareString {
            beat32Sec = "S"
        } else if drumItem29 == instrumentStrings.rimshotString {
            beat32Sec = "RS"
        } else if drumItem29 == instrumentStrings.sidestickString {
            beat32Sec = "SS"
        } else if drumItem29 == instrumentStrings.hhCloseString {
            beat32Sec = "HHC"
        } else if drumItem29 == instrumentStrings.hhOpenString {
            beat32Sec = "HHO"
        } else if drumItem29 == instrumentStrings.hiTomString {
            beat32Sec = "HT"
        } else if drumItem29 == instrumentStrings.midTomString {
            beat32Sec = "MT"
        } else if drumItem29 == instrumentStrings.lowTomString {
            beat32Sec = "LT"
        } else if drumItem29 == instrumentStrings.crashString {
            beat32Sec = "C"
        } else if drumItem29 == instrumentStrings.rideString {
            beat32Sec = "RD"
        } else if drumItem29 == instrumentStrings.random1String {
            beat32Sec = "OT"
        } else if  drumItem29 == instrumentStrings.random2String {
            beat32Sec = "OT2"
        }
        
        
        let drumItem30 = beat?.beat32Half
        
        if drumItem30 == instrumentStrings.kickString {
            beat32half = "K"
        } else if drumItem30 == instrumentStrings.snareString {
            beat32half = "S"
        } else if drumItem30 == instrumentStrings.rimshotString {
            beat32half = "RS"
        } else if drumItem30 == instrumentStrings.sidestickString {
            beat32half = "SS"
        } else if drumItem30 == instrumentStrings.hhCloseString {
            beat32half = "HHC"
        } else if drumItem30 == instrumentStrings.hhOpenString {
            beat32half = "HHO"
        } else if drumItem30 == instrumentStrings.hiTomString {
            beat32half = "HT"
        } else if drumItem30 == instrumentStrings.midTomString {
            beat32half = "MT"
        } else if drumItem30 == instrumentStrings.lowTomString {
            beat32half = "LT"
        } else if drumItem30 == instrumentStrings.crashString {
            beat32half = "C"
        } else if drumItem30 == instrumentStrings.rideString {
            beat32half = "RD"
        } else if drumItem30 == instrumentStrings.random1String {
            beat32half = "OT"
        } else if  drumItem30 == instrumentStrings.random2String {
            beat32half = "OT2"
        }
        
       
        let drumItem31 = beat?.beat33First
        
        
        if drumItem31 == instrumentStrings.kickString {
            beat33 = "K"
        } else if drumItem31 == instrumentStrings.snareString {
            beat33 = "S"
        } else if drumItem31 == instrumentStrings.rimshotString {
            beat33 = "RS"
        } else if drumItem31 == instrumentStrings.sidestickString {
            beat33 = "SS"
        } else if drumItem31 == instrumentStrings.hhCloseString {
            beat33 = "HHC"
        } else if drumItem31 == instrumentStrings.hhOpenString {
            beat33 = "HHO"
        } else if drumItem31 == instrumentStrings.hiTomString {
            beat33 = "HT"
        } else if drumItem31 == instrumentStrings.midTomString {
            beat33 = "MT"
        } else if drumItem31 == instrumentStrings.lowTomString {
            beat33 = "LT"
        } else if drumItem31 == instrumentStrings.crashString {
            beat33 = "C"
        } else if drumItem31 == instrumentStrings.rideString {
            beat33 = "RD"
        } else if drumItem31 == instrumentStrings.random1String {
            beat33 = "OT"
        } else if  drumItem31 == instrumentStrings.random2String {
            beat33 = "OT2"
        }
        
        
        
        let drumItem32 = beat?.beat33Second
        
        if drumItem32 == instrumentStrings.kickString {
            beat33Sec = "K"
        } else if drumItem32 == instrumentStrings.snareString {
            beat33Sec = "S"
        } else if drumItem32 == instrumentStrings.rimshotString {
            beat33Sec = "RS"
        } else if drumItem32 == instrumentStrings.sidestickString {
            beat33Sec = "SS"
        } else if drumItem32 == instrumentStrings.hhCloseString {
            beat33Sec = "HHC"
        } else if drumItem32 == instrumentStrings.hhOpenString {
            beat33Sec = "HHO"
        } else if drumItem32 == instrumentStrings.hiTomString {
            beat33Sec = "HT"
        } else if drumItem32 == instrumentStrings.midTomString {
            beat33Sec = "MT"
        } else if drumItem32 == instrumentStrings.lowTomString {
            beat33Sec = "LT"
        } else if drumItem32 == instrumentStrings.crashString {
            beat33Sec = "C"
        } else if drumItem32 == instrumentStrings.rideString {
            beat33Sec = "RD"
        } else if drumItem32 == instrumentStrings.random1String {
            beat33Sec = "OT"
        } else if  drumItem32 == instrumentStrings.random2String {
            beat33Sec = "OT2"
        }
        
        
        
        
        let drumItem33 = beat?.beat33Half
        
        if drumItem33 == instrumentStrings.kickString {
            beat33half = "K"
        } else if drumItem33 == instrumentStrings.snareString {
            beat33half = "S"
        } else if drumItem33 == instrumentStrings.rimshotString {
            beat33half = "RS"
        } else if drumItem33 == instrumentStrings.sidestickString {
            beat33half = "SS"
        } else if drumItem33 == instrumentStrings.hhCloseString {
            beat33half = "HHC"
        } else if drumItem33 == instrumentStrings.hhOpenString {
            beat33half = "HHO"
        } else if drumItem33 == instrumentStrings.hiTomString {
            beat33half = "HT"
        } else if drumItem33 == instrumentStrings.midTomString {
            beat33half = "MT"
        } else if drumItem33 == instrumentStrings.lowTomString {
            beat33half = "LT"
        } else if drumItem33 == instrumentStrings.crashString {
            beat33half = "C"
        } else if drumItem33 == instrumentStrings.rideString {
            beat33half = "RD"
        } else if drumItem33 == instrumentStrings.random1String {
            beat33half = "OT"
        } else if  drumItem33 == instrumentStrings.random2String {
            beat33half = "OT2"
        }
        
        
        
        let drumItem34 = beat?.beat34First
        
        
        if drumItem34 == instrumentStrings.kickString {
            beat34 = "K"
        } else if drumItem34 == instrumentStrings.snareString {
            beat34 = "S"
        } else if drumItem34 == instrumentStrings.rimshotString {
            beat34 = "RS"
        } else if drumItem34 == instrumentStrings.sidestickString {
            beat34 = "SS"
        } else if drumItem34 == instrumentStrings.hhCloseString {
            beat34 = "HHC"
        } else if drumItem34 == instrumentStrings.hhOpenString {
            beat34 = "HHO"
        } else if drumItem34 == instrumentStrings.hiTomString {
            beat34 = "HT"
        } else if drumItem34 == instrumentStrings.midTomString {
            beat34 = "MT"
        } else if drumItem34 == instrumentStrings.lowTomString {
            beat34 = "LT"
        } else if drumItem34 == instrumentStrings.crashString {
            beat34 = "C"
        } else if drumItem34 == instrumentStrings.rideString {
            beat34 = "RD"
        } else if drumItem34 == instrumentStrings.random1String {
            beat34 = "OT"
        } else if  drumItem34 == instrumentStrings.random2String {
            beat34 = "OT2"
        }
        
        
        
        
        let drumItem35 = beat?.beat34Second
        
        
        if drumItem35 == instrumentStrings.kickString {
            beat34Sec = "K"
        } else if drumItem35 == instrumentStrings.snareString {
            beat34Sec = "S"
        } else if drumItem35 == instrumentStrings.rimshotString {
            beat34Sec = "RS"
        } else if drumItem35 == instrumentStrings.sidestickString {
            beat34Sec = "SS"
        } else if drumItem35 == instrumentStrings.hhCloseString {
            beat34Sec = "HHC"
        } else if drumItem35 == instrumentStrings.hhOpenString {
            beat34Sec = "HHO"
        } else if drumItem35 == instrumentStrings.hiTomString {
            beat34Sec = "HT"
        } else if drumItem35 == instrumentStrings.midTomString {
            beat34Sec = "MT"
        } else if drumItem35 == instrumentStrings.lowTomString {
            beat34Sec = "LT"
        } else if drumItem35 == instrumentStrings.crashString {
            beat34Sec = "C"
        } else if drumItem35 == instrumentStrings.rideString {
            beat34Sec = "RD"
        } else if drumItem35 == instrumentStrings.random1String {
            beat34Sec = "OT"
        } else if  drumItem35 == instrumentStrings.random2String {
            beat34Sec = "OT2"
        }
        
        
        
        let drumItem36 = beat?.beat34Half
        
        if drumItem36 == instrumentStrings.kickString {
            beat34half = "K"
        } else if drumItem36 == instrumentStrings.snareString {
            beat34half = "S"
        } else if drumItem36 == instrumentStrings.rimshotString {
            beat34half = "RS"
        } else if drumItem36 == instrumentStrings.sidestickString {
            beat34half = "SS"
        } else if drumItem36 == instrumentStrings.hhCloseString {
            beat34half = "HHC"
        } else if drumItem36 == instrumentStrings.hhOpenString {
            beat34half = "HHO"
        } else if drumItem36 == instrumentStrings.hiTomString {
            beat34half = "HT"
        } else if drumItem36 == instrumentStrings.midTomString {
            beat34half = "MT"
        } else if drumItem36 == instrumentStrings.lowTomString {
            beat34half = "LT"
        } else if drumItem36 == instrumentStrings.crashString {
            beat34half = "C"
        } else if drumItem36 == instrumentStrings.rideString {
            beat34half = "RD"
        } else if drumItem36 == instrumentStrings.random1String {
            beat34half = "OT"
        } else if  drumItem36 == instrumentStrings.random2String {
            beat34half = "OT2"
        }
        
        
        
        
        let drumItem37 = beat?.beat41First
        
        if drumItem37 == instrumentStrings.kickString {
            beat41 = "K"
        } else if drumItem37 == instrumentStrings.snareString {
            beat41 = "S"
        } else if drumItem37 == instrumentStrings.rimshotString {
            beat41 = "RS"
        } else if drumItem37 == instrumentStrings.sidestickString {
            beat41 = "SS"
        } else if drumItem37 == instrumentStrings.hhCloseString {
            beat41 = "HHC"
        } else if drumItem37 == instrumentStrings.hhOpenString {
            beat41 = "HHO"
        } else if drumItem37 == instrumentStrings.hiTomString {
            beat41 = "HT"
        } else if drumItem37 == instrumentStrings.midTomString {
            beat41 = "MT"
        } else if drumItem37 == instrumentStrings.lowTomString {
            beat41 = "LT"
        } else if drumItem37 == instrumentStrings.crashString {
            beat41 = "C"
        } else if drumItem37 == instrumentStrings.rideString {
            beat41 = "RD"
        } else if drumItem37 == instrumentStrings.random1String {
            beat41 = "OT"
        } else if  drumItem37 == instrumentStrings.random2String {
            beat41 = "OT2"
        }
        
        
        
        let drumItem38 = beat?.beat41Second
        
        if drumItem38 == instrumentStrings.kickString {
            beat41Sec = "K"
        } else if drumItem38 == instrumentStrings.snareString {
            beat41Sec = "S"
        } else if drumItem38 == instrumentStrings.rimshotString {
            beat41Sec = "RS"
        } else if drumItem38 == instrumentStrings.sidestickString {
            beat41Sec = "SS"
        } else if drumItem38 == instrumentStrings.hhCloseString {
            beat41Sec = "HHC"
        } else if drumItem38 == instrumentStrings.hhOpenString {
            beat41Sec = "HHO"
        } else if drumItem38 == instrumentStrings.hiTomString {
            beat41Sec = "HT"
        } else if drumItem38 == instrumentStrings.midTomString {
            beat41Sec = "MT"
        } else if drumItem38 == instrumentStrings.lowTomString {
            beat41Sec = "LT"
        } else if drumItem38 == instrumentStrings.crashString {
            beat41Sec = "C"
        } else if drumItem38 == instrumentStrings.rideString {
            beat41Sec = "RD"
        } else if drumItem37 == instrumentStrings.random1String {
            beat41Sec = "OT"
        } else if  drumItem37 == instrumentStrings.random2String {
            beat41Sec = "OT2"
        }
        
        
        
        let drumItem39 = beat?.beat41Half
        
        if drumItem39 == instrumentStrings.kickString {
            beat41half = "K"
        } else if drumItem39 == instrumentStrings.snareString {
            beat41half = "S"
        } else if drumItem39 == instrumentStrings.rimshotString {
            beat41half = "RS"
        } else if drumItem39 == instrumentStrings.sidestickString {
            beat41half = "SS"
        } else if drumItem39 == instrumentStrings.hhCloseString {
            beat41half = "HHC"
        } else if drumItem39 == instrumentStrings.hhOpenString {
            beat41half = "HHO"
        } else if drumItem39 == instrumentStrings.hiTomString {
            beat41half = "HT"
        } else if drumItem39 == instrumentStrings.midTomString {
            beat41half = "MT"
        } else if drumItem39 == instrumentStrings.lowTomString {
            beat41half = "LT"
        } else if drumItem39 == instrumentStrings.crashString {
            beat41half = "C"
        } else if drumItem39 == instrumentStrings.rideString {
            beat41half = "RD"
        } else if drumItem39 == instrumentStrings.random1String {
            beat41half = "OT"
        } else if  drumItem39 == instrumentStrings.random2String {
            beat41half = "OT2"
        }
        
        
        let drumItem40 = beat?.beat42First
        
        if drumItem40 == instrumentStrings.kickString {
            beat42 = "K"
        } else if drumItem40 == instrumentStrings.snareString {
            beat42 = "S"
        } else if drumItem40 == instrumentStrings.rimshotString {
            beat42 = "RS"
        } else if drumItem40 == instrumentStrings.sidestickString {
            beat42 = "SS"
        } else if drumItem40 == instrumentStrings.hhCloseString {
            beat42 = "HHC"
        } else if drumItem40 == instrumentStrings.hhOpenString {
            beat42 = "HHO"
        } else if drumItem40 == instrumentStrings.hiTomString {
            beat42 = "HT"
        } else if drumItem40 == instrumentStrings.midTomString {
            beat42 = "MT"
        } else if drumItem40 == instrumentStrings.lowTomString {
            beat42 = "LT"
        } else if drumItem40 == instrumentStrings.crashString {
            beat42 = "C"
        } else if drumItem40 == instrumentStrings.rideString {
            beat42 = "RD"
        } else if drumItem40 == instrumentStrings.random1String {
            beat42 = "OT"
        } else if  drumItem40 == instrumentStrings.random2String {
            beat42 = "OT2"
        }
        
        
        
        let drumItem41 = beat?.beat42Second
        
        if drumItem41 == instrumentStrings.kickString {
            beat42Sec = "K"
        } else if drumItem41 == instrumentStrings.snareString {
            beat42Sec = "S"
        } else if drumItem41 == instrumentStrings.rimshotString {
            beat42Sec = "RS"
        } else if drumItem41 == instrumentStrings.sidestickString {
            beat42Sec = "SS"
        } else if drumItem41 == instrumentStrings.hhCloseString {
            beat42Sec = "HHC"
        } else if drumItem41 == instrumentStrings.hhOpenString {
            beat42Sec = "HHO"
        } else if drumItem41 == instrumentStrings.hiTomString {
            beat42Sec = "HT"
        } else if drumItem41 == instrumentStrings.midTomString {
            beat42Sec = "MT"
        } else if drumItem41 == instrumentStrings.lowTomString {
            beat42Sec = "LT"
        } else if drumItem41 == instrumentStrings.crashString {
            beat42Sec = "C"
        } else if drumItem41 == instrumentStrings.rideString {
            beat42Sec = "RD"
        } else if drumItem41 == instrumentStrings.random1String {
            beat42Sec = "OT"
        } else if  drumItem41 == instrumentStrings.random2String {
            beat42Sec = "OT2"
        }
        
        
        let drumItem42 = beat?.beat42Half
        
        if drumItem42 == instrumentStrings.kickString {
            beat42half = "K"
        } else if drumItem42 == instrumentStrings.snareString {
            beat42half = "S"
        } else if drumItem42 == instrumentStrings.rimshotString {
            beat42half = "RS"
        } else if drumItem42 == instrumentStrings.sidestickString {
            beat42half = "SS"
        } else if drumItem42 == instrumentStrings.hhCloseString {
            beat42half = "HHC"
        } else if drumItem42 == instrumentStrings.hhOpenString {
            beat42half = "HHO"
        } else if drumItem42 == instrumentStrings.hiTomString {
            beat42half = "HT"
        } else if drumItem42 == instrumentStrings.midTomString {
            beat42half = "MT"
        } else if drumItem42 == instrumentStrings.lowTomString {
            beat42half = "LT"
        } else if drumItem42 == instrumentStrings.crashString {
            beat42half = "C"
        } else if drumItem42 == instrumentStrings.rideString {
            beat42half = "RD"
        } else if drumItem42 == instrumentStrings.random1String {
            beat42half = "OT"
        } else if  drumItem42 == instrumentStrings.random2String {
            beat42half = "OT2"
        }
        
        
        
        let drumItem43 = beat?.beat43First
        
        if drumItem43 == instrumentStrings.kickString {
            beat43 = "K"
        } else if drumItem43 == instrumentStrings.snareString {
            beat43 = "S"
        } else if drumItem43 == instrumentStrings.rimshotString {
            beat43 = "RS"
        } else if drumItem43 == instrumentStrings.sidestickString {
            beat43 = "SS"
        } else if drumItem43 == instrumentStrings.hhCloseString {
            beat43 = "HHC"
        } else if drumItem43 == instrumentStrings.hhOpenString {
            beat43 = "HHO"
        } else if drumItem43 == instrumentStrings.hiTomString {
            beat43 = "HT"
        } else if drumItem43 == instrumentStrings.midTomString {
            beat43 = "MT"
        } else if drumItem43 == instrumentStrings.lowTomString {
            beat43 = "LT"
        } else if drumItem43 == instrumentStrings.crashString {
            beat43 = "C"
        } else if drumItem43 == instrumentStrings.rideString {
            beat43 = "RD"
        } else if drumItem43 == instrumentStrings.random1String {
            beat43 = "OT"
        } else if  drumItem43 == instrumentStrings.random2String {
            beat43 = "OT2"
        }
        
        
        let drumItem44 = beat?.beat43Second
        
        if drumItem44 == instrumentStrings.kickString {
            beat43Sec = "K"
        } else if drumItem44 == instrumentStrings.snareString {
            beat43Sec = "S"
        } else if drumItem44 == instrumentStrings.rimshotString {
            beat43Sec = "RS"
        } else if drumItem44 == instrumentStrings.sidestickString {
            beat43Sec = "SS"
        } else if drumItem44 == instrumentStrings.hhCloseString {
            beat43Sec = "HHC"
        } else if drumItem44 == instrumentStrings.hhOpenString {
            beat43Sec = "HHO"
        } else if drumItem44 == instrumentStrings.hiTomString {
            beat43Sec = "HT"
        } else if drumItem44 == instrumentStrings.midTomString {
            beat43Sec = "MT"
        } else if drumItem44 == instrumentStrings.lowTomString {
            beat43Sec = "LT"
        } else if drumItem44 == instrumentStrings.crashString {
            beat43Sec = "C"
        } else if drumItem44 == instrumentStrings.rideString {
            beat43Sec = "RD"
        } else if drumItem44 == instrumentStrings.random1String {
            beat43Sec = "OT"
        } else if  drumItem44 == instrumentStrings.random2String {
            beat43Sec = "OT2"
        }
        
        
        let drumItem45 = beat?.beat43Half
        
        if drumItem45 == instrumentStrings.kickString {
            beat43half = "K"
        } else if drumItem45 == instrumentStrings.snareString {
            beat43half = "S"
        } else if drumItem45 == instrumentStrings.rimshotString {
            beat43half = "RS"
        } else if drumItem45 == instrumentStrings.sidestickString {
            beat43half = "SS"
        } else if drumItem45 == instrumentStrings.hhCloseString {
            beat43half = "HHC"
        } else if drumItem45 == instrumentStrings.hhOpenString {
            beat43half = "HHO"
        } else if drumItem45 == instrumentStrings.hiTomString {
            beat43half = "HT"
        } else if drumItem45 == instrumentStrings.midTomString {
            beat43half = "MT"
        } else if drumItem45 == instrumentStrings.lowTomString {
            beat43half = "LT"
        } else if drumItem45 == instrumentStrings.crashString {
            beat43half = "C"
        } else if drumItem45 == instrumentStrings.rideString {
            beat43half = "RD"
        } else if drumItem45 == instrumentStrings.random1String {
            beat43half = "OT"
        } else if  drumItem45 == instrumentStrings.random2String {
            beat43half = "OT2"
        }
        
        
        let drumItem46 = beat?.beat44First
        
        
        if drumItem46 == instrumentStrings.kickString {
            beat44 = "K"
        } else if drumItem46 == instrumentStrings.snareString {
            beat44 = "S"
        } else if drumItem46 == instrumentStrings.rimshotString {
            beat44 = "RS"
        } else if drumItem46 == instrumentStrings.sidestickString {
            beat44 = "SS"
        } else if drumItem46 == instrumentStrings.hhCloseString {
            beat44 = "HHC"
        } else if drumItem46 == instrumentStrings.hhOpenString {
            beat44 = "HHO"
        } else if drumItem46 == instrumentStrings.hiTomString {
            beat44 = "HT"
        } else if drumItem46 == instrumentStrings.midTomString {
            beat44 = "MT"
        } else if drumItem46 == instrumentStrings.lowTomString {
            beat44 = "LT"
        } else if drumItem46 == instrumentStrings.crashString {
            beat44 = "C"
        } else if drumItem46 == instrumentStrings.rideString {
            beat44 = "RD"
        } else if drumItem46 == instrumentStrings.random1String {
            beat44 = "OT"
        } else if  drumItem46 == instrumentStrings.random2String {
            beat44 = "OT2"
        }
        
        
        
        let drumItem47 = beat?.beat44Second
        
        if drumItem47 == instrumentStrings.kickString {
            beat44Sec = "K"
        } else if drumItem47 == instrumentStrings.snareString {
            beat44Sec = "S"
        } else if drumItem47 == instrumentStrings.rimshotString {
            beat44Sec = "RS"
        } else if drumItem47 == instrumentStrings.sidestickString {
            beat44Sec = "SS"
        } else if drumItem47 == instrumentStrings.hhCloseString {
            beat44Sec = "HHC"
        } else if drumItem47 == instrumentStrings.hhOpenString {
            beat44Sec = "HHO"
        } else if drumItem47 == instrumentStrings.hiTomString {
            beat44Sec = "HT"
        } else if drumItem47 == instrumentStrings.midTomString {
            beat44Sec = "MT"
        } else if drumItem47 == instrumentStrings.lowTomString {
            beat44Sec = "LT"
        } else if drumItem47 == instrumentStrings.crashString {
            beat44Sec = "C"
        } else if drumItem47 == instrumentStrings.rideString {
            beat44Sec = "RD"
        } else if drumItem47 == instrumentStrings.random1String {
            beat44Sec = "OT"
        } else if  drumItem47 == instrumentStrings.random2String {
            beat44Sec = "OT2"
        }
        
        
        
        
        
        
        let drumItem48 = beat?.beat44Half
        
        if drumItem48 == instrumentStrings.kickString {
            beat44half = "K"
        } else if drumItem48 == instrumentStrings.snareString {
            beat44half = "S"
        } else if drumItem48 == instrumentStrings.rimshotString {
            beat44half = "RS"
        } else if drumItem48 == instrumentStrings.sidestickString {
            beat44half = "SS"
        } else if drumItem48 == instrumentStrings.hhCloseString {
            beat44half = "HHC"
        } else if drumItem48 == instrumentStrings.hhOpenString {
            beat44half = "HHO"
        } else if drumItem48 == instrumentStrings.hiTomString {
            beat44half = "HT"
        } else if drumItem48 == instrumentStrings.midTomString {
            beat44half = "MT"
        } else if drumItem48 == instrumentStrings.lowTomString {
            beat44half = "LT"
        } else if drumItem48 == instrumentStrings.crashString {
            beat44half = "C"
        } else if drumItem48 == instrumentStrings.rideString {
            beat44half = "RD"
        } else if drumItem48 == instrumentStrings.random1String {
            beat44half = "OT"
        } else if  drumItem48 == instrumentStrings.random2String {
            beat44half = "OT2"
        }
        
        noteNamesForbar()
        
    }
}
    

struct EditABeat_Previews: PreviewProvider {
    static var previews: some View {
        EditABeat()
    }
}
