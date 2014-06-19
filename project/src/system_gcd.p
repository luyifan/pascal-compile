program yu;
var x,y,z:integer;

function gcd(u:integer):integer;
begin
  if u > 1 then
     begin
     write(u);
     gcd := gcd(u-1)+10;   {the assign to the function must be in the last sentence}
     end;
end;
begin
 x:= 50;
 y:= 34;
write(gcd(x));
end.
