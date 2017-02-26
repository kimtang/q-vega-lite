
/ vlite:localhost:14010::

\l vlite.q


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

.vl.atom
  .vl.facet_grid["column:Origin"]
  .vl.geom_point
  .vl.plot[cars;"x:Horsepower,y:Acceleration,color:Origin"]

.vl.atom
 .vl.xlab["dateMonth"]
 .vl.geom_line
 .vl.plot[economics;"x:date,y:unemploy"]


11
