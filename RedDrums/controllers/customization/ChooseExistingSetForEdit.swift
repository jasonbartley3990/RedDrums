//
//  ChooseExistingSetForEdit.swift
//  RedDrums
//
//  Created by Jason bartley on 12/6/21.
//

import SwiftUI
import CoreData

struct ChooseExistingSetForEdit: View {
    @Environment(\.managedObjectContext) var context
    @Environment(\.presentationMode) var presentationMode
    
    @State private var sets: [DrumKit] = []
    
    var onDone: (String) -> Void = { name in
        
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Text("")
                Text("Select Set").font(.system(size: 30))
                
                List {
                    ForEach(sets, id: \.self) { set in
                        HStack {
                            Text(set.name!)
                            Spacer()
                            
                            NavigationLink(destination: EditSet(set: set).environment(\.managedObjectContext, context), label: {
                                Spacer()
                                Text("Edit")
                            }).foregroundColor(Color.green)
                            Text(" ")
                            Text("Delete").foregroundColor(Color.red).onTapGesture {
                                deleteASet(set: set)
                            }
                        }
                    }
                    
                }
                
                HStack {
                    ZStack {
                        Circle().fill(Color.red).frame(width: (geo.size.height * 0.2) , height: geo.size.height * 0.2)
                        
                        Text("Back").foregroundColor(Color.white).font(.system(size: 19))
                        
                    }.onTapGesture {
                        KickPlayer.kick.playSound(sound: "kick1")
                        HapticsManager.shared.hapticShakeIntense()
                        presentationMode.wrappedValue.dismiss()
                    }.padding()
                    
                    
                    Spacer()
                }
            }
            
        }.onAppear(perform: {
            fetchSets()
            prepareHaptics()
        })
    }
    
    func fetchSets() {
        do {
            sets = try context.fetch(DrumKit.fetchRequest())
            print(sets)
        } catch {
            print("opps")
        }
    }
    
    func prepareHaptics() {
        
    }
    
    func deleteASet(set: DrumKit) {
        context.delete(set)
        
        do {
            try self.context.save()
        } catch {
            print("error in saving")
        }
        
        fetchSets()
    }
    
    
}

struct ChooseExistingSetForEdit_Previews: PreviewProvider {
    static var previews: some View {
        ChooseExistingSetForEdit()
    }
}
