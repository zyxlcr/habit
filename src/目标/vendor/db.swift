//
//  db.swift
//  目标
//
//  Created by arick on 2022/11/30.
//

import Foundation
import SQLite

class HabitRow{
    var id = Expression<Int64>("id")
    var yiyi = Expression<String>("yiyi")
    var title = Expression<String>("title")
    var specific = Expression<String>("specific")
    var measurable = Expression<String>("measurable")
    var actionable = Expression<String>("actionable")
    var result = Expression<String>("result")
    var timely = Expression<String>("timely")
    var dotime = Expression<String>("dotime")
    
}

class Habit{
    var id:Int64 = 1
    var yiyi = ""
    var title = ""
    var specific  = ""
    var measurable = ""
    var actionable = ""
    var result  = ""
    var timely = ""
    var dotime = ""
    
}


class Db{
    
    static let path = NSSearchPathForDirectoriesInDomains(
        .documentDirectory, .userDomainMask, true
    ).first!
    
    static let habit = Table("habit")
    
    static let habitRow = HabitRow()
    
    
    static func initHabit(){
        do{
            
            let db = try Connection("\(path)/db.sqlite3")
            
            try db.run(habit.create { t in     // CREATE TABLE "users" (
                t.column(habitRow.id, primaryKey: true) //     "id" INTEGER PRIMARY KEY NOT NULL,
                t.column(habitRow.yiyi, unique: true)  //     "email" TEXT UNIQUE NOT NULL,
                t.column(habitRow.title)                 //     "name" TEXT
                t.column(habitRow.specific)
                t.column(habitRow.measurable)
                t.column(habitRow.actionable)
                t.column(habitRow.result)
                t.column(habitRow.timely)
                t.column(habitRow.dotime)
            })
            
            
        }
        catch{
            print("catch wrong")
        }
        
    }
    
    static func insert(s:Habit) ->Int64{
        do{
            let db = try Connection("\(path)/db.sqlite3")
            let habit = Table("habit")
            
            
            let rowid = try db.run(habit.insert(habitRow.yiyi <- s.yiyi,habitRow.title <- s.title,habitRow.specific <- s.specific,habitRow.measurable <- s.measurable,habitRow.actionable<-s.actionable,habitRow.result  <- s.result,habitRow.timely <- s.timely,habitRow.dotime <- s.dotime))
            print("inserted id: \(rowid)")
            return rowid
        }
        catch{
            print("catch wrong")
            return 0
        }
        
    }
    
    static func GetAll() -> Array<Habit>{
        do{
            let db = try Connection("\(path)/db.sqlite3")
            let habit = Table("habit")
            
            let query = habit.select(habit[*]).order(habitRow.dotime.desc)
            //let all = Array(try db.prepareRowIterator(habit))
            var hebList = [Habit]()
//            if let t = all.first{
//                try t.get(habitRow.title)
//                print(t)
//            }
            
            let all = try db.prepareRowIterator(query)
            try all.map  { //row in
                let h = Habit()
                h.title = $0[habitRow.title]
                h.yiyi = $0[habitRow.yiyi]
                h.specific = $0[habitRow.specific]
                h.id = $0[habitRow.id]
                h.measurable = $0[habitRow.measurable]
                h.result = $0[habitRow.result]
                h.actionable = $0[habitRow.actionable]
                h.timely = $0[habitRow.timely]
                h.dotime = $0[habitRow.dotime]
                hebList.append(h)
                
            }
            
            //print(hebList[0].specific)
            return hebList
            
        }catch{
            print("catch wrong")
            
        }
        return Array()
    }
    
    static func saveDone(id:Int64){
        do{
            let db = try Connection("\(path)/db.sqlite3")
            let habit = Table("habit")
            
            let query = habit.filter(habitRow.id == id) .update(habitRow.result <- "1")
            try db.run(query)
        }catch{
            
        }
    }
    
    

    
}
