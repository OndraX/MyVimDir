u:=1cm;
pickup pencircle scaled 0.05u;
def k (expr s, r) =
  draw fullcircle scaled r shifted s;
enddef;
def uhel (expr uhel, delka, pocatek, pj, pd ) =
  path kmakro;
  kmakro:= fullcircle scaled delka shifted pocatek;
  pair bodjednamakro; pair boddvamakro; pair bodtrimakro;
  bodjednamakro:= pj intersectionpoint kmakro;
  boddvamakro:= pd intersectionpoint kmakro;
  bodtrimakro:= boddvamakro rotatedaround(pocatek,uhel/2);
  draw bodjednamakro .. bodtrimakro .. boddvamakro;
enddef;


beginfig()


  <++>


endfig;


end
