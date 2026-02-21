# Google Sheets Formula Guide (Topic Pipeline)

假设列如下：
- G: Subs(K)
- H: Publish Date
- I: Views
- K: Comments
- P: 7d Views/Subs
- Q: Comment Rate
- R: Freshness Score
- S: Total Score
- T: Decision

## Q2 (Comment Rate)
=IFERROR(K2/I2,0)

## P2 (7d Views/Subs)
=IFERROR(I2/(G2*1000),0)

## R2 (Freshness Score)
=MAX(0,10-(TODAY()-H2))

## S2 (Total Score)
=ROUND((P2*0.5 + Q2*200*0.3 + R2*0.2),2)

## T2 (Decision)
=IF(S2>=8,"DO",IF(S2>=5,"MAYBE","DROP"))

将以上公式向下填充即可。
