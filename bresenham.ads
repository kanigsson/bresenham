package Bresenham with SPARK_Mode is

   Screen_Width : constant := 240;
   Screen_Height : constant := 135;

   subtype Natural_Width is Natural range 0 .. Screen_Width;
   subtype Natural_Height is Natural range 0 .. Screen_Height;

   --  Currently support one direction only
   --  Assume we start in (0,0), and DX > DY
   procedure Draw_Line (X2 : Natural_Width; Y2 : Natural_Height)
   with Pre => X2 >= Y2;
end Bresenham;
