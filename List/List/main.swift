//
//  main.swift
//  List
//
//  Created by  chao on 2016/7/27.
//  Copyright © 2016年  chao. All rights reserved.
//

import Foundation

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class List {
    var head: ListNode?
    var tail: ListNode?
    
    
    //尾插法
    func appendToTail(val: Int)  {
        if tail == nil {
            tail = ListNode(val)
            head = tail;
        } else {
            tail!.next = ListNode(val)
            tail = tail!.next
        }
    }
    //头插法
    func appendToHead(val: Int)  {
        if tail == nil {
            head = ListNode(val)
            tail = head
        } else {
            let temp = ListNode(val)
            temp.next = head
            head = temp
        }
    }
    //Dummy节点和尾插法
}


/*
 *给一个链表和一个值x，要求只保留链表中所有小于x的值，原链表的节点顺序不能变。
 *例：1->5->3->2->4->2，给定x = 3。则我们要返回 1->2->2
 */
func getLeftList(head: ListNode?, _ x: Int) -> ListNode?  {
    
    let prevDummy = ListNode(0)
    var prev = prevDummy
    let postDummy = ListNode(0)
    var post = postDummy
    
    
    var node = head
    
    while node != nil {
        if node!.val < x {
            prev.next = node
            prev = node!
        } else {
            post.next = node
            post = node!
        }
        node = node!.next
    }
    post.next = nil
    prev.next = postDummy.next
    return prevDummy.next
}

//快行指针

func hadCycle(head: ListNode?) -> Bool {
    var slow = head
    var fast = head
    
    while fast != nil && fast!.next != nil {
        slow = slow!.next
        fast = fast!.next!.next
        
        if slow === fast {
            return true
        }
    }
    return false
}

/*
 *删除链表中倒数第n个节点。例：1->2->3->4->5，n = 2。返回1->2->3->5。
 *注意：给定n的长度小于等于链表的长度
 */

/*解题思路依然是快行指针，这次两个指针移动速度相同。但是一开始，第一个指针（指向头结点之前）就落后第二个指针n个节点。
 *接着两者同时移当第二个移动到尾节点时，第一个节点的下一个节点就是我们要删除的节点。代码如下：
 */

func removeNthFromEnd(head: ListNode?, _ n: Int) ->ListNode? {
    guard let head = head else {
        return nil
    }
    
    let dummy = ListNode(0)
    dummy.next = head
    var prev: ListNode? = dummy
    var post: ListNode? = dummy
    
    for _ in 0 ..< n {
        if post == nil {
            break
        }
        post = post!.next
    }
    
    while post != nil && post!.next != nil {
        prev = prev!.next
        post = post!.next
    }
    
    //删除节点
    prev!.next = prev!.next!.next
    
    return dummy.next
}
