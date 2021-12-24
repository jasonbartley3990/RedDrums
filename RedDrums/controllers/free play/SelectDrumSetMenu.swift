//
//  SelectDrumSetMenu.swift
//  RedDrums
//
//  Created by Jason bartley on 12/6/21.
//

import SwiftUI
struct SelectDrumSetMenu: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    @State private var allKits: [DrumKit] = []
    
    @State private var selectedSet: DrumKit?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack {
                    HStack {
                        ZStack {
                            Circle().fill(Color.white).frame(width: geo.size.height * 0.2, height: geo.size.height * 0.2)
                            
                            Text("Back").foregroundColor(Color.black)
                        }.onTapGesture {
                            MidTomPlayer.MidTom.playSound(sound: "midTom1")
                            presentationMode.wrappedValue.dismiss()
                        }
                        
                        
                        Spacer()
                    }
                    
                    HStack {
                        ZStack {
                            NavigationLink(destination: DrumSet(isStandard: true), label: {
                                ZStack {
                                    Circle().fill(Color.white).frame(width: (geo.size.height * 0.75) , height: geo.size.height * 0.75)
                                    
                                    VStack {
                                        Image(systemName: "music.note").resizable().foregroundColor(Color.black).frame(width: geo.size.height * 0.3, height: geo.size.height * 0.3).aspectRatio(contentMode: .fit)
                                        Text("Play Standard Set").font(.system(size: 25)).foregroundColor(Color.black)
                                    }
                                    
                                }
                            })
                            
                        }
                        
                        
                        
                        ZStack {
                            NavigationLink(destination: ChooseSetForPlaying().environment(\.managedObjectContext, context), label: {
                                ZStack {
                                    Circle().fill(Color.red).frame(width: (geo.size.height * 0.75) , height: geo.size.height * 0.75)
                                    
                                    
                                    VStack {
                                        Image(systemName: "music.note.house").resizable().foregroundColor(Color.white).frame(width: geo.size.height * 0.3, height: geo.size.height * 0.3).aspectRatio(contentMode: .fit)
                                        
                                        Text("Play Custom Set").font(.system(size: 25)).foregroundColor(Color.white)
                                        
                                        
                                    }
                                   
                                }
                            })
                        }
                        
                    }
                    
                }
                
            }
        }.onAppear(perform: {
        })
    }
    
    func fetchSets() {
        do {
            allKits = try context.fetch(DrumKit.fetchRequest())
        } catch {
            
        }
    }
}

struct SelectDrumSet_Previews: PreviewProvider {
    static var previews: some View {
        SelectDrumSetMenu()
    }
}

