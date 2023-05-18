package Bresenham with SPARK_Mode is

   Screen_Width : constant := 240;
   Screen_Height : constant := 135;

   subtype Natural_Width is Natural range 0 .. Screen_Width;
   subtype Natural_Height is Natural range 0 .. Screen_Height;

   type Point is record
      X : Natural_Width;
      Y : Natural_Height;
   end record;

   --  Currently support one direction only
   procedure Draw_Line (Start, Stop : Point)
   with Pre => Start.X < Stop.X and then Start.Y <= Stop.Y and then (Stop.X - Start.X) >= (Stop.Y - Start.Y);
end Bresenham;
