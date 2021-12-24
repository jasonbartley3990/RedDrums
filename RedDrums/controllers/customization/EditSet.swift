//
//  EditSet.swift
//  RedDrums
//
//  Created by Jason bartley on 12/6/21.
//

import SwiftUI

struct EditSet: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var context
    @State private var showingSelectionScreen = false
    @State public var set: DrumKit
    
    @State var currentDrumItem: DrumItem = .kick
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.black.ignoresSafeArea()
                
                HStack {
                    VStack(alignment: .center) {
                        
                        Spacer()
                        
                        ZStack {
                            Circle().fill(Color.red).frame(width: (geo.size.height * 0.45) - 5, height: (geo.size.height * 0.45) - 5, alignment: .center).onTapGesture {
                                currentDrumItem = .kick
                                self.showingSelectionScreen = true
                                HapticsManager.shared.hapticShakeIntense()
                            }
                            
                            VStack {
                                Text("Kick").foregroundColor(.white).font(.system(size: 14))
                                Text("Sounds").foregroundColor(.white).font(.system(size: 14))
                            }
                        }
                        
                        Spacer()
                        
                        ZStack {
                            Circle().fill(Color.red).frame(width: (geo.size.height * 0.45) - 5, height: (geo.size.height * 0.45) - 5, alignment: .center).onTapGesture {
                                currentDrumItem = .snare
                                HapticsManager.shared.hapticShakeIntense()
                                self.showingSelectionScreen = true
                            }
                            
                            VStack {
                                Text("Snare").foregroundColor(.white).font(.system(size: 14))
                                Text("Sounds").foregroundColor(.white).font(.system(size: 14))
                                
                            }
                        }
                        
                        Spacer()
                        
                    }
                    VStack(alignment: .center) {
                        
                        Spacer()
                        
                        ZStack {
                            Circle().fill(Color.red).frame(width: (geo.size.height * 0.45) - 5, height: (geo.size.height * 0.45) - 5, alignment: .center).onTapGesture {
                                currentDrumItem = .lowtom
                                self.showingSelectionScreen = true
                                HapticsManager.shared.hapticShakeIntense()
                            }
                            
                            VStack {
                                Text("Low Tom").foregroundColor(.white).font(.system(size: 14))
                                Text("Sounds").foregroundColor(.white).font(.system(size: 14))
                            }
                       
                        }
                        
                        Spacer()
                        
                        ZStack {
                            Circle().fill(Color.red).frame(width: (geo.size.height * 0.45) - 5, height: (geo.size.height * 0.45) - 5, alignment: .center).onTapGesture {
                                currentDrumItem = .rimshot
                                self.showingSelectionScreen = true
                                HapticsManager.shared.hapticShakeIntense()
                            }
                            VStack {
                                Text("Rimshot").foregroundColor(.white).font(.system(size: 14))
                                Text("Sounds").foregroundColor(.white).font(.system(size: 14))
                            }
                       
                        }
                        
                        Spacer()
                    }
                    
                    VStack {
                        
                        Spacer()
                        
                        ZStack {
                            Circle().fill(Color.red).frame(width: (geo.size.height * 0.33) - 12, height: (geo.size.height * 0.33) - 12, alignment: .center).onTapGesture {
                                currentDrumItem = .midtom
                                self.showingSelectionScreen = true
                                HapticsManager.shared.hapticShakeIntense()
                            }
                            
                            VStack {
                                Text("Mid Tom").foregroundColor(.white).font(.system(size: 13))
                                Text("Sounds").foregroundColor(.white).font(.system(size: 13))
                                
                            }
                       
                        }
                        
                        Spacer()
                        
                        ZStack {
                            Circle().fill(Color.red).frame(width: (geo.size.height * 0.33) - 12, height: (geo.size.height * 0.33) - 12, alignment: .center).onTapGesture {
                                currentDrumItem = .hitom
                                self.showingSelectionScreen = true
                                HapticsManager.shared.hapticShakeIntense()
                            }
                            
                            
                            VStack {
                                Text("Hi Tom").foregroundColor(.white).font(.system(size: 13))
                                Text("Sounds").foregroundColor(.white).font(.system(size: 13))
                            }
                       
                        }
                        
                        Spacer()
                        
                        ZStack {
                            Circle().fill(Color.red).frame(width: (geo.size.height * 0.33) - 12, height: (geo.size.height * 0.33) - 12, alignment: .center).onTapGesture {
                                currentDrumItem = .sidestick
                                self.showingSelectionScreen = true
                                HapticsManager.shared.hapticShakeIntense()
                            }
                            
                            VStack {
                                Text("Sidestick").foregroundColor(.white).font(.system(size: 13))
                                Text("Sounds").foregroundColor(.white).font(.system(size: 13))
                            }
                        }
                        
                        Spacer()
                        
                    }
                    
                    VStack {
                        Spacer()
                        
                        ZStack {
                            Circle().fill(Color.red).frame(width: (geo.size.height * 0.33) - 12, height: (geo.size.height * 0.33) - 12, alignment: .center).onTapGesture {
                                currentDrumItem = .crash
                                self.showingSelectionScreen = true
                                HapticsManager.shared.hapticShakeIntense()
                            }
                            
                            VStack {
                                Text("Crash").foregroundColor(.white).font(.system(size: 13))
                                Text("Sounds").foregroundColor(.white).font(.system(size: 13))
                            }
                            
                        }
                        
                        Spacer()
                        
                        ZStack {
                            Circle().fill(Color.red).frame(width: (geo.size.height * 0.33) - 12, height: (geo.size.height * 0.33) - 12, alignment: .center).onTapGesture {
                                self.showingSelectionScreen = true
                                HapticsManager.shared.hapticShakeIntense()
                            }
                            
                            VStack {
                                Text("Random 1").foregroundColor(.white).font(.system(size: 13))
                                Text("Sounds").foregroundColor(.white).font(.system(size: 13))
                            }
                            
                        }
                        
                        Spacer()
                        
                        ZStack {
                            Circle().fill(Color.red).frame(width: (geo.size.height * 0.33) - 12, height: (geo.size.height * 0.33) - 12, alignment: .center).onTapGesture {
                                self.showingSelectionScreen = true
                                HapticsManager.shared.hapticShakeIntense()
                            }
                            
                            VStack {
                                Text("Random 2").foregroundColor(.white).font(.system(size: 13))
                                Text("Sounds").foregroundColor(.white).font(.system(size: 13))
                            }
                        }
                        
                        Spacer()
                    }
                    
                    VStack {
                        Spacer()
                        
                        ZStack {
                            Circle().fill(Color.green).frame(width: (geo.size.height * 0.25) - 12, height: (geo.size.height * 0.25) - 12, alignment: .center).onTapGesture {
                                presentationMode.wrappedValue.dismiss()
                                HapticsManager.shared.hapticShakeIntense()
                            }
                            VStack {
                                Text("Save").foregroundColor(.white).font(.system(size: 13))
                                Text("& Exit").foregroundColor(.white).font(.system(size: 13))
                            }
                        }
                        
                        Spacer()
                        
                        ZStack {
                            Circle().fill(Color.red).frame(width: (geo.size.height * 0.25) - 12, height: (geo.size.height * 0.25) - 12, alignment: .center).onTapGesture {
                                currentDrumItem = .ride
                                HapticsManager.shared.hapticShakeIntense()
                                self.showingSelectionScreen = true
                            }
                            
                            VStack {
                                Text("Ride").foregroundColor(.white).font(.system(size: 13))
                                Text("Sounds").foregroundColor(.white).font(.system(size: 13))
                                
                            }
                            
                        }
                        
                        Spacer()
                        
                        ZStack {
                            Circle().fill(Color.red).frame(width: (geo.size.height * 0.25) - 12, height: (geo.size.height * 0.25) - 12, alignment: .center).onTapGesture {
                                currentDrumItem = .hihatopen
                                HapticsManager.shared.hapticShakeIntense()
                                self.showingSelectionScreen = true
                            }
                            
                            VStack {
                                Text("HHO").foregroundColor(.white).font(.system(size: 13))
                                Text("Sounds").foregroundColor(.white).font(.system(size: 13))
                                
                            }
                           
                       
                        }
                        
                        Spacer()
                        
                        ZStack {
                            Circle().fill(Color.red).frame(width: (geo.size.height * 0.25) - 12, height: (geo.size.height * 0.25) - 12, alignment: .center).onTapGesture {
                                currentDrumItem = .hihatclose
                                HapticsManager.shared.hapticShakeIntense()
                                self.showingSelectionScreen = true
                            }
                            
                            VStack {
                                Text("HHC").foregroundColor(.white).font(.system(size: 13))
                                Text("Sounds").foregroundColor(.white).font(.system(size: 13))
                                
                            }
                            
                        }
                        
                        Spacer()
                    }
                }
                
            }.background(Color.black).sheet(isPresented: $showingSelectionScreen) {
                ChangeDrumItem(drumItem: $currentDrumItem, drumSet: set)
                
            }.onAppear(perform: prepareHaptics)
        }
        
    }
    
    func prepareHaptics() {
        HapticsManager.shared.prepareHaptics()
    }
}
