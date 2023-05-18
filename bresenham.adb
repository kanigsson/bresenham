with Ada.Text_IO;
package body Bresenham with SPARK_Mode is

   procedure Plot (X : Natural_Width; Y : Natural_Height);
   procedure Plot (X : Natural_Width; Y : Natural_Height) is
   begin
      Ada.Text_IO.Put_Line (X'Img & Y'Img);
   end;

--  from wikipedia
--  plotLine(x0, y0, x1, y1)
--      dx = x1 - x0
--      dy = y1 - y0
--      D = 2*dy - dx
--      y = y0
--  
--      for x from x0 to x1
--          plot(x, y)
--          if D > 0
--              y = y + 1
--              D = D - 2*dx
--          end if
--          D = D + 2*dy
   procedure Draw_Line (Start, Stop : Point) is
      DX : constant Natural_Width := Stop.X - Start.X;
      DY : constant Natural_Height := Stop.Y - Start.Y;
      D : Integer := 2 * DY - DX;
      Y : Natural_Height := Start.Y;
   begin
      for X in Start.X .. Stop.X loop
         pragma Loop_Invariant (D = 2 * ((X - Start.X) + 1) * DY - (2 * (Y - Start.Y) + 1) * DX);
         pragma Loop_Invariant (2 * (DY - DX) <= D and then D <= 2 * DY);
         pragma Loop_Invariant (DX * Y <= DX * Start.Y + (X - Start.X) * DY);
         Plot (X, Y);
         if D > 0 then
            Y := Y + 1;
            D := D - 2 * DX;
         end if;
         D := D + 2 * DY;
      end loop;
   end Draw_Line;

end Bresenham;
