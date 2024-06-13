-- String Functions
-- 1. Len 
Select Len ('Akhila') as NameLength

--2. Left
Select left ('Akhila' ,4) as NameLeft

-- 3. Right
Select Right ('Akhila' ,4) as NameRight

-- 4. Substring (starts with index 1)
Select Substring ('Akhila' ,2,4) as NameSubString

-- 5. Upper
Select Upper ('Akhila') as NameToUpper

-- 6. Lower
Select Lower ('AKHILA') as NameToLower

-- 7. Ltrim
Select Ltrim ('      Akhila     ') as NameToLtrim
Select Ltrim ('Akhila' , 'Ak') as NameToLtrim

-- 8. Rtrim
Select Rtrim ('      Akhila     ') as NameToRtrim
Select Rtrim ('Akhila' , 'la') as NameToRtrim

-- 9. CharIndex
Select CharIndex('cool' , 'This is cool') as NameToCharIndex

-- 10. Replace
Select Replace('This is fun day.Lets Enjoy the day','day','night') as NameReplace

-- 11. Concat
Select Concat ('Akhila',' Mucharla') as NameConcat

-- 12. Replicate -> Repeat
Select Replicate ('Akhila ',3) as NameReplicate

-- 13. Reverse
Select Reverse ('Akhila') as NameReverse


-- Mathematical Functions

-- 1. Abs (gives +ve value)
Select Abs(-5)

-- 2. Power
Select Power(2,4)

-- 3. Round
Select Round(67.42384 ,3)

-- 4. Ceiling
Select  Ceiling (67.42384)

-- 5. Floor
Select  Floor (67.42384)


-- Date Functions

-- 1. GetDate
Select GetDate() as Today

-- 2. DateAdd
Select DateAdd(day, 10,GetDate()) 

-- 3. DateDiff
Select DateDiff(day,'2024-01-01','2024-06-13')
Select DateDiff(month,'2024-01-01','2024-06-13')
Select DateDiff(year,'2024-01-01','2024-06-13')
Select DateDiff(hour,'2024-01-01','2024-06-13')

-- 4. Format
Select Format(GetDate(), 'dd MM yyyy')
Select Format(GetDate(), 'dd MMM yyyy')
Select Format(GetDate(), 'dd MMMM yyyy')

-- 5. DatePart (Extracts the part from the date)
Select DatePart(month, GetDate())
Select DatePart(day, GetDate()) 
Select DatePart(year, GetDate()) 