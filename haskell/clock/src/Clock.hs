module Clock (addDelta, fromHourMin, toString) where


-- Constants

minutesPerHour :: Int
minutesPerHour = 60

minutesPerDay :: Int
minutesPerDay =  1440


-- Clock type
data Clock =  Clock Hour Minute
  deriving Eq

instance Show Clock where
  show (Clock hour minute) = show hour ++ ":" ++ show minute

instance Num Clock where
  (+) (Clock (Hour x) (Minute y)) (Clock (Hour x') (Minute y')) =
    mkClock (x + x') (y + y')
  (-) (Clock (Hour x) (Minute y)) (Clock (Hour x') (Minute y')) =
    mkClock (x - x') (y - y')
  (*) (Clock (Hour x) (Minute y)) (Clock (Hour x') (Minute y')) =
    mkClock (x * x') (y * y')
  negate (Clock (Hour x) (Minute y)) =
    mkClock (negate x) (negate y)
  abs (Clock (Hour x) (Minute y)) =
    mkClock (abs x) (abs y)
  signum (Clock (Hour x) (Minute y)) =
    mkClock (signum x) (signum y)
  fromInteger x =
    -- On the hour
    mkClock (fromInteger x) 0

mkClock :: Int -> Int -> Clock
mkClock hour minute = Clock (mkHour total) (mkMinute total)
  where
    total = totalMinutes hour minute 


-- Hour type
newtype Hour = Hour Int
  deriving Eq

mkHour :: Int -> Hour
mkHour hour = Hour $ div hour minutesPerHour

instance Show Hour where
  show (Hour x) = 
    if abs x < 10
    then "0" ++ show x
    else show x


-- Minute type
newtype Minute = Minute Int
  deriving Eq

mkMinute :: Int -> Minute
mkMinute minute = Minute $ mod minute minutesPerHour

instance Show Minute where
  show (Minute x) = 
    if x < 10
    then "0" ++ show x
    else show x


totalMinutes :: Int -> Int -> Int
totalMinutes hour minute =
  if total < 0
  then total + 1440
  else total
  where total = mod ((hour * minutesPerHour) + minute) minutesPerDay


-- Public Functions

fromHourMin :: Int -> Int -> Clock
fromHourMin = mkClock

toString :: Clock -> String
toString = show

addDelta :: Int -> Int -> Clock -> Clock
addDelta hour minute = (+) (mkClock hour minute)

