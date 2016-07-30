//
//  main.swift
//  Stack
//
//  Created by  chao on 2016/7/30.
//  Copyright © 2016年  chao. All rights reserved.
//

import Foundation

class Stack {
    var stack: [AnyObject]
    
    init() {
        stack = [AnyObject]()
    }
    
    func push(object: AnyObject)  {
        stack.append(object)
    }
    
    func pop() -> AnyObject? {
        if !isEmpty() {
            return stack.removeLast()
        } else {
            return nil
        }
    }
    
    func isEmpty() -> Bool {
        return stack.isEmpty
    }
    
    func peek() -> AnyObject? {
        return stack.last
    }
    
    func size() -> Int {
        return stack.count
    }
}

//队列
class Queue {
    var queue: [AnyObject]
    init() {
        queue = [AnyObject]()
    }
    
    func enqueue(object: AnyObject)  {
        queue.append(object)
    }
    
    func dequeue() -> AnyObject? {
        if !isEmpty() {
            return queue.removeFirst()
        } else {
            return nil
        }
    }
    
    func isEmpty() -> Bool {
        return queue.isEmpty
    }
    
    func siz() -> Int {
        return queue.count
    }
}

/*Given an absolute path for a file (Unix-style), simplify it.
 *For example,
 *path = "/home/", => "/home"
 *path = "/a/./b/../../c/", => "/c"
 */

/*首先输入是个 String，代表路径。输出要求也是 String, 同样代表路径。
 *我们可以把 input 根据 “/” 符号去拆分，比如 "/a/b/./../d/" 就拆成了一个String数组["a", "b", ".", "..", "d"]
 *创立一个栈然后遍历拆分后的 String 数组，对于一般 String ，直接加入到栈中，对于 ".." 那我们就对栈做pop操作，其他情况不错处理
 */

func simplifyPath(path: String) -> String {
    var res = ""
    var stack = [String]()
    
    let paths = path.characters.split {$0 == "/"}.map(String.init)
    
    for path in paths {
        let path = path.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        guard path != "." else {
            continue
        }
        
        if path == ".." {
            if stack.count > 0 {
                stack.removeLast()
            }
        } else if path.characters.count > 0 {
            stack.append(path)
        }
    }
    
    for str in stack {
        res += "/"
        res += str
    }
    
    return res.isEmpty ? "/" : res
}
 







