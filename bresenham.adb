with Ada.Text_IO;
package body Bresenham with SPARK_Mode is

   procedure Plot (X : Natural_Width; Y : Natural_Height);
   procedure Plot (X : Natural_Width; Y : Natural_Height) is
   begin
      Ada.Text_IO.Put_Line (X'Img & Y'Img);
   end;

   function Best (X2, X : Natural_Width; Y2, Y: Natural_Height) return Boolean is
      (for all Y_Alt in 0 .. Y2 => abs (X2 * Y - X * Y2) <= abs (X2 * Y_Alt - X * Y2));

   procedure Draw_Line (X2 : Natural_Width; Y2 : Natural_Height) is
      DX : constant Natural_Width := X2 ;
      DY : constant Natural_Height := Y2;
      D : Integer := 2 * DY - DX;
      X : Natural_Width := 0;
      Y : Natural_Height := 0;
   begin
      loop
         pragma Loop_Invariant (D = 2 * (X + 1) * DY - (2 * Y + 1) * DX);
         pragma Loop_Invariant (2 * (DY - DX) <= D and then D <= 2 * DY);
         pragma Loop_Invariant (X <= X2);
         Plot(X, Y);
         exit when X = X2;
         if D > 0 then
            Y := Y + 1;
            D := D - 2 * DX;
         end if;
         D := D + 2 * DY;
         X := X + 1;
      end loop;
   end Draw_Line;

end Bresenham;
