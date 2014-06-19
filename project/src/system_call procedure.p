program yu;
var x,y,z:integer;

function gcd(u:integer):integer;
begin
  if u > 1 then
     begin
     write(u);
     gcd := gcd(u-1);   
     end;
end;

procedure dddd(u:integer);
begin
     write(4);
end;

begin
 x:= 50;
 y:= 34;
 dddd;
 write(gcd(x));
end.
