---
title: python中的and和or
date: 2022-11-01 11:51:26
tags: python
---

#### and & or

> 不仅作为逻辑判断链接，而且可以取多个值中的一个

#### and

> 所有为真：找最后一个真
>
> ```python
> a = 1 and 2
> --> a == 2
> ```
>
>
>
> 所有为假：找第一个假
>
> ```python
> b = '' and 0 and {}
> --> b == ''
> ```
>
>
>
> 有真有假：找第一个假
>
> ```python
> c = '' and 1 and "hello"
> --> c == ''
> ```

#### or

> 所有为真：找第一个真
>
> ```python
> a = 1 or 2
> --> a == 1
> ```
>
> 所有为假：找最后一个假
>
> ```python
> b = '' or 0 or {}
> --> b == {}
> ```
>
> 有真有假： 找第一个真
>
> ```python
> c = '' or 1 or {} or 2
> ```

#### 类比

> and很像物理线路图中的串联电路，or就像并联电路。
>
> 串联电路中只要有一处断开（假），就不通。
>
> 并联电路中只有一处连接（真），就通。
