---
title: matchPathIn2DimensionMatrix.md
date: 2022-08-04 14:32:55
tags: algorithm
---

#### 记录一个有意思的类比

#### 原链接

[多条路线种的景点匹配](https://leetcode.cn/problems/ju-zhen-zhong-de-lu-jing-lcof/)



#### 思路过程

##### 降级

描述：

```
森林里有一条风景路，沿路有颐和园、圆明园、故宫等等；有一张风景名单，上面记录着一些风景区名字（故宫、恭王府）；现在要你来判断这条路上有没有顺序和风景都和风景名单完全一致的路段。
```

解决：

```
拿着名单从风景路开头开始走，风景名单上第一个是故宫，路上第一个景区是颐和园，不一样，继续走直到和风景名单的第一个景区一样，直到走到故宫，发现一样，名单上划掉故宫，继续走，发现下一个是恭王府，和名单上一样。这时候名单已经到底了，找到了这样的一条路。
```

实现：

```python
class Solution(object):
    def matchStringIn1DimensionArray(self, array, string):
        i, j = 0, 0
        lengtharray, lengthstring = len(array), len(string)
        while i < lengtharray:
            while i < lengtharray and j < lengthstring and array[i] == string[j]:
                i += 1
                j += 1
            if j == lengthstring:
                return True
            # 这行是路上的景区和名单上部分一致的情况，需要回到上一次匹配
            #     的下一个景区
            i = i - j + 1
            j = 0
```

##### 原来情况

描述：

```
现在森林里有很多条景区路，每一个景区都是一个对应路口（有二条、三条或四条路可以走），也就是可以有四条路到达下一个景区；一张景区名单；现在要你来判断这条路上有没有顺序和风景都和风景名单完全一致的路段。
```

解决：

```
任选一个风景点，比如第一个风景单作为起点，然后用风景名单来对，发现和名单上第一个风景一样，为了防止下次把这个风景点重复浏览，从地图上把这个风景点标记已走过，然后从名单山划掉这个风景区；现在从四条路线里任选一条路，前往下一个地点，下一个地点继续通过以上流程来判断；当发现下一个景点不匹配回到这个景点（这时候要返回上一个景区）的时候就需要在地图上把当前景点的走过标记清除掉了；当名单上的最后一个景点也被划去的时候就代表着找到这样一条路了；当走出景区路了就代表着这条支路上就不匹配了。
```

实现1：

```python
class Solution(object):
    def matchstringin2dimensionarray(self, array, string, i, j, index):
      	# 代表景区名单划完了
        if index == len(string):
            return True
          
				# 代表走出景区路了
        if i < 0 or i >= len(array) or j < 0 or j >= len(array[0]) or array[i][j] != string[index]:
            return False
				
        # 代表当前景点和名单上一致
        if array[i][j] == string[index]:
          	# 标记当前景点已经走过，防止重复走
            char = array[i][j]
            array[i][j] = ''
            # 去往下一个景点
            result = self.matchstringin2dimensionarray(array, string, i, j+1, index+1) or \
                self.matchstringin2dimensionarray(array, string, i, j-1, index+1) or \
                self.matchstringin2dimensionarray(array, string, i+1, j, index+1) or \
                self.matchstringin2dimensionarray(array, string, i-1, j, index+1)
            # 将当前景点的标记清除
            array[i][j] = char
            return result
          
    # 从任意景点作为起点
    def match(self, matrix, string):
        i, j = 0, 0
        row, column = len(matrix), len(matrix[0])

        while i < row:
            while j < column:
                if self.matchstringin2dimensionarray(matrix, string, i, j, 0):
                    return True
                j += 1
            i += 1
        return False
```

实现2:

这样写需要优化，防止覆盖。现在还不满足条件。

```python
其实和实现1是一样的，没有1好理解，就是将选择当前景点的下一个景点写成循环。
```

#### 理解

> 其实我们的日常语言：也就是汉语、英语…，编程语言，数学：都是现实、观念现实的映射或者类比，也就是对日常形式化的表达。如果只在形式这一层来想问题（当然只在这一次层想问题也有明白的情况，不过得建立在对想要表达的东西都建立起了清晰的心理表征的时候），就会出现想不明白、我是不是傻这样的问题，一个很不放在心上的技巧就是用合理的例子去想问题的解决办法。
> 我上面的描述看起来好像看起来复杂了，其实完全没有，用合理的例子想问题，然后通过例子构建模型才是最符合大脑的建模。

