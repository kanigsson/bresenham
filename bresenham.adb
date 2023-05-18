with Ada.Text_IO;
package body Bresenham with SPARK_Mode is

   procedure Plot (X : Natural_Width; Y : Natural_Height);
   procedure Plot (X : Natural_Width; Y : Natural_Height) is
   begin
      Ada.Text_IO.Put_Line (X'Img & Y'Img);
   end;

   function Best (X2, X : Natural_Width; Y2, Y: Natural_Height) return Boolean is
      (for all Y_Alt in 0 .. Y2 => abs (X2 * Y - X * Y2) <= abs (X2 * Y_Alt - X * Y2));

   --  procedure Lemma_Closest (A : Natural_Width; B : Natural_Height; C : Natural) 
   --  with Pre => C <= Natural_Width'Last * Natural_Height'Last and then Abs (2 * A * B - 2 * C) <= A,
   --       Post => (for all D in 0 .. Natural_Height'Last => Abs (A * B - C) <= Abs (A * D - C)),
   --       Ghost, Global => null;

   --  procedure Lemma_Closest (A : Natural_Width; B : Natural_Height; C : Natural) is
   --  begin
   --     null;
   --  end Lemma_Closest;

   procedure Draw_Line (X2 : Natural_Width; Y2 : Natural_Height) is
      DX : constant Natural_Width := X2 ;
      DY : constant Natural_Height := Y2;
      D : Integer := 2 * DY - DX;
      Y : Natural_Height := 0;
   begin
      for X in 0 .. X2 loop
         pragma Loop_Invariant (D = 2 * (X + 1) * DY - (2 * Y + 1) * DX);
         pragma Loop_Invariant (2 * (DY - DX) <= D and then D <= 2 * DY);
   --      Lemma_Closest (X2, Y, X * Y2);
   --      pragma Assert (Best (X2, Y2, X, Y));
         Plot (X, Y);
         if D > 0 then
            Y := Y + 1;
            D := D - 2 * DX;
         end if;
         D := D + 2 * DY;
      end loop;
   end Draw_Line;

end Bresenham;
