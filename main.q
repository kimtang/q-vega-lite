
/ vlite:localhost:14010::

\l qlib\bt\bt.q
\l vlite.q

data:([]a:"CDECDECDE";b:2 1 8 7 2 4 4 6 7)
data:([]a:2 1 8 7 2 4 4 6 7;b:2 1 8 7 2 4 4 6 7;c:0.2 0.1 0.8 0.7 0.2 0.4 0.4 0.6 0.7;d:9?"AB";e:0.2 0.1 0.8 0.7 0.2 0.4 1.4 1.6 1.7)

load `:diamonds
load `:economics
load `:cars

aes:"x:carat,y:price,color:cut"
aes:`x`y`color!`carat`price`cut


.vl.atom
 .vl.geom_point
 .vl.plot[100?diamonds;aes]


.vl.atom
  .vl.facet_grid["row:color,column:clarity"]
  .vl.geom_point
  .vl.plot[100?diamonds;"x:carat,y:log price,color:color"]

cols cars


.vl.atom
  .vl.facet_grid["row:color,column:clarity"]
  .vl.geom_point
  .vl.plot[cars;"x:Horsepower,y:Acceleration"]

.vl.atom
 .vl.xlab["dateMonth"]
 .vl.geom_line
 .vl.plot[economics;"x:date,y:unemploy"]


11
