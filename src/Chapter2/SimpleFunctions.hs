module Chapter2.SimpleFnctions where


firstOrEmpty lst = if not (null lst) then head lst else "empty"

lst1 +++ lst2 = if null lst1 
                then lst2
                else head lst1 : (tail lst1 +++ lst2)


reverse2 lst = if null lst
               then []
               else reverse2 (tail lst) +++ [head lst]

maxandmin lst = let h = head lst
            in if null (tail lst)
	       then (h, h)
               else ( if h > t_max then h else t_max
	            , if h < t_min then h else t_min )
		    where t = maxandmin (tail lst)
		          t_max = fst t
			  t_min = snd t

fib :: Integer -> Integer
fib num = case num of
		0 -> 0
		1 -> 1
		_ -> fib (num - 1) + fib (num - 2)

(++++) :: [a] -> [a] -> [a]

[] ++++ lst2 = lst2
(x:xs) ++++ lst2 = x:(xs ++++ lst2)

maxmin lst | null (tail lst) = (head lst, head lst)
maxmin lst | otherwise = let min_xs = snd (maxmin (tail lst))
			     max_xs = fst (maxmin (tail lst))
			   in (if (head lst) > max_xs then (head lst) else max_xs, if (head lst) < min_xs then (head lst) else min_xs)


positive a = a > 0
ackerman 0 n = n+1
ackerman m 0 = ackerman (m-1) 1
ackerman m n | m > 0 && n > 0 = ackerman (m-1) (ackerman m (n-1))

duplicate :: a -> (a, a)
duplicate x = (x,x)

nothing _= Nothing

index [] = []
index [x] = [(0,x)]
index (x:xs) = let indexed@((n,_):_) = index xs
               in  (n+1,x):indexed

mayBe :: [a] -> Char
mayBe [] = 'a'


filterOnes lst = filter (== 1) lst
filterANumber lst num = filter (==num) lst
filterNot lst num = filter (/=num) lst
