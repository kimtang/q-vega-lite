

\d .vl

/ helpers function

pc:{parse["select from t",$[count x;" where ",x;""]]. 2 0}
pb:{parse["select",$[count x;" by ",x;""]," from t"]3}
pa:{parse["select ",x," from t"]4}

pa0:()!()
pa0[99h]:{[x]x}
pa0[10h]:{[x]pa x}

data:{[d] enlist[`data]!enlist enlist["values"]!enlist d }

encoding:{[data;aes;field] tipe:(01b!("quantitative";"nominal")) max 10 11h in type data aes field;enlist[field]!enlist `field`type!(aes field;tipe ) }


/ api functions

atom:{[obj]embed:`mode`spec!("vega-lite";obj`spec);("atomEditor";embed)}

xlab:{[title;obj]
 aes:obj`aes;data:obj`data;spec:obj`spec;
 spec[`encoding;`x]:spec[`encoding;`x],enlist[`axis]!enlist enlist[`title]!enlist title;
 `aes`data`spec!(aes;data;spec)
 }

ylab:{[title;obj]
 aes:obj`aes;data:obj`data;spec:obj`spec;
 spec[`encoding;`y]:spec[`encoding;`x],enlist[`axis]!enlist enlist[`title]!enlist title;
 `aes`data`spec!(aes;data;spec)
 }


plot:{[d;aes] aes:pa0[type aes] aes;spec:data d;
 `aes`data`spec!(aes;d;spec)
 }

geom_point:{[obj]aes:obj`aes;data:obj`data;spec:obj`spec;
 allowed:allowed where (allowed:`x`y`size`shape`color) in key aes;
 ec:((enlist`)!(enlist{})),raze encoding[data;aes;]@'allowed;
 spec:spec,`encoding`mark!(ec;"point");
 `aes`data`spec!(aes;data;spec)
 }

geom_circle:{[obj]aes:obj`aes;data:obj`data;spec:obj`spec;
  allowed:allowed where (allowed:`x`y`size`color) in key aes;
  ec:((enlist`)!(enlist{})),raze encoding[data;aes;]@'allowed;
  spec:spec,`encoding`mark!(ec;"circle");
  `aes`data`spec!(aes;data;spec)
  }

geom_square:{[obj]aes:obj`aes;data:obj`data;spec:obj`spec;
  allowed:allowed where (allowed:`x`y`size`color) in key aes;
  ec:((enlist`)!(enlist{})),raze encoding[data;aes;]@'allowed;
  spec:spec,`encoding`mark!(ec;"square");
  `aes`data`spec!(aes;data;spec)
 }

geom_text:{[obj]aes:obj`aes;data:obj`data;spec:obj`spec;
  allowed:allowed where (allowed:`x`y`size`color`text) in key aes;
  ec:((enlist`)!(enlist{})),raze encoding[data;aes;]@'allowed;
  spec:spec,`encoding`mark!(ec;"text");
  `aes`data`spec!(aes;data;spec)
  }

geom_tick:{[obj]aes:obj`aes;data:obj`data;spec:obj`spec;
 allowed:allowed where (allowed:`x`y) in key aes;
 ec:((enlist`)!(enlist{})),raze encoding[data;aes;]@'allowed;
 spec:spec,`encoding`mark!(ec;"tick");
 `aes`data`spec!(aes;data;spec)
 }

geom_bar:{[obj]aes:obj`aes;data:obj`data;spec:obj`spec;
  allowed:allowed where (allowed:`x`y`size`color) in key aes;
  ec:((enlist`)!(enlist{})),raze encoding[data;aes;]@'allowed;
  spec:spec,`encoding`mark!(ec;"bar");
  `aes`data`spec!(aes;data;spec)
  }

geom_line:{[obj]aes:obj`aes;data:obj`data;spec:obj`spec;
 allowed:allowed where (allowed:`x`y`detail`color`path) in key aes;
 ec:((enlist`)!(enlist{})),raze encoding[data;aes;]@'allowed;
 spec:spec,`encoding`mark!(ec;"line");
 `aes`data`spec!(aes;data;spec)
 }


geom_area:{[obj]aes:obj`aes;data:obj`data;spec:obj`spec;
 allowed:allowed where (allowed:`x`y`detail`color`path) in key aes;
 ec:((enlist`)!(enlist{})),raze encoding[data;aes;]@'allowed;
 spec:spec,`encoding`mark!(ec;"area");
 `aes`data`spec!(aes;data;spec)
 }
