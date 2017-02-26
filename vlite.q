

\d .vl

/ helpers function

pc:{parse["select from t",$[count x;" where ",x;""]]. 2 0}
pb:{parse["select",$[count x;" by ",x;""]," from t"]3}
pa:{parse["select ",x," from t"]4}

pa0:()!()
pa0[99h]:{[x]x}
pa0[10h]:{[x]pa x}

data:{[d] enlist[`data]!enlist enlist["values"]!enlist d }



encoding_:(enlist 0nh)!enlist "quantitative"
encoding_[abs type " "]:"nominal" / 10h
encoding_[abs type `]:"nominal"  / 11h
encoding_[abs type 0np]:"temporal" / 12h
encoding_[abs type 0nm]:"temporal" / 13h
encoding_[abs type 0nd]:"temporal" / 14h
encoding_[abs type 0nz]:"temporal" / 15h
encoding_[abs type 0nn]:"temporal" / 16h
encoding_[abs type 0nu]:"temporal" / 17h
encoding_[abs type 0nv]:"temporal" / 18h
encoding_[abs type 0nt]:"temporal" / 19h

sel:sel!sel:key encoding_

axisLegend_:`row`column`x`y`color`size`shape!`axis`axis`axis`axis`legend`legend`legend

encoding:{[data;aes;field]
  tipe:encoding_ sel type data field;
  name:string aes field;
  axisLegend:axisLegend_ field;
  enlist[field]!enlist (`field`type,axisLegend)!(field;tipe;enlist[`title]!enlist name )
 }

facet:{[data;facets;field]
  tipe:encoding_ sel type data facets field;
  name:string facets field;
  axisLegend:axisLegend_ field;
  enlist[field]!enlist (`field`type,axisLegend)!(facets field;tipe;enlist[`title]!enlist name )
 }

/ api functions

facet_grid:{[facets;obj] aes:obj`aes;data:obj`data;spec:obj`spec;
  facets:pa0[type facets] facets;
  allowed:allowed where (allowed:`row`column) in key facets;
  ec:((enlist`)!(enlist{})),raze facet[data;facets;]@'allowed;
  spec[`encoding]:spec[`encoding],ec;
  `aes`data`spec!(aes;data;spec)
 }


atom:{[obj]embed:`mode`spec!("vega-lite";obj`spec);("atomEditor";embed)}

xlab:{[title;obj]
 aes:obj`aes;data:obj`data;spec:obj`spec;
 spec[`encoding;`x]:spec[`encoding;`x],enlist[`axis]!enlist enlist[`title]!enlist title;
 `aes`data`spec!(aes;data;spec)
 }

ylab:{[title;obj]
 aes:obj`aes;data:obj`data;spec:obj`spec;
 spec[`encoding;`y]:spec[`encoding;`y],enlist[`axis]!enlist enlist[`title]!enlist title;
 `aes`data`spec!(aes;data;spec)
 }


plot:{[d;aes]
 aes:pa0[type aes] aes;
 spec:data d:![d;();0b;aes];
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
