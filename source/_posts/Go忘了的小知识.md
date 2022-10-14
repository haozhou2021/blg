---
title: Go忘了的小知识
date: 2022-10-12 20:58:48
tags: Go
---

#### 类型

> ```go
> type Class struct {
> 	Start int
> 	Length int
> }
>
> ```
>
> ```go
> type ClassOne Class
> ```
>
> 这是定义了一个新类型，原有的结构体Class的方法不会ClassOne没有
>
> ```go
> type ClassTwo = Class
> ```
>
> 这是把结构体Class起了个别名，所以显然，Class结构体绑定的方法ClassTwo都可以使用。

#### 方法接收者

> ```go
> // 方法接受者为指针
> func (c *Class) GetLongestPalindrome(s string) string {
> 	for i := 0; i < len(s); i++ {
> 		c.compare(s, i, i)
> 		c.compare(s, i, i+1)
> 	}
>
> 	return s[c.Start: c.Start+c.Length]
> }
>
> // 方法接收者不是指针
> func (c Class) compare(s string, i, j int) {
> 	for 0 <= i && j < len(s) && s[i] == s[j] {
> 		i -= 1
> 		j += 1
> 	}
>
> 	if j - i > c.Length {
> 		c.Start = i + 1
> 		c.Length = j - i - 1
> 	}
> }
> ```
>
> ##### 区别
>
> 指针接受者：调用方法的时候会改变原来结构体字段
>
> 非指针接受者：不会改变原来结构体的字段
>
> ##### 调用
>
> 无论定义的是指针接受者还是非指针接受者，都可以通过指针变量或非指针变量调用
> 都能调用的原因是编译器做了响应的转化，p.method() -> (*p).method()
>
>
