import Group

--Returns the group of nonzero integers mod n with multiplication mod n.
zx :: (Integral a) => a -> Group a
zx n = Group { set  = set_Zx  n
             , func = func_Zx n }
--Returns the set of nonzero integers mod n
set_Zx :: (Integral a) => a -> [a]
set_Zx n = [1..(n-1)]
--Returns multiplication mod n
func_Zx :: (Integral a) => a -> a -> a -> a
func_Zx n = (\x y -> mod (x * y) n)

zn :: (Integral a) => Group a
zn = zx 13

main = do
  { putStrLn . showGroup $ zn
  ; print . verAxAll $ zn
  ; print . isGroup  $ zn
  ; print . identity $ zn
  ; print $ map (inverse zn) (set zn)
  }