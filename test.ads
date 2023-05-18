with Interfaces; use Interfaces;
package Test with SPARK_Mode is

   Screen_Width : constant := 240;
   Screen_Height : constant := 135;

   subtype Natural_Width is Natural range 0 .. Screen_Width;
   subtype Natural_Height is Natural range 0 .. Screen_Height;

   type Point is record
      X : Natural_Width;
      Y : Natural_Height;
   end record;

   procedure Draw_Line
     (Start, Stop : Point;
      Thickness   : Natural := 1;
      Fast        : Boolean := True);

end Test;
