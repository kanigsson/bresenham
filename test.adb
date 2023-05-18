with Ada.Text_IO; use Ada.Text_IO;
package body Test with SPARK_Mode is

   procedure Draw_Line
     (Start, Stop : Point;
      Thickness   : Natural := 1;
      Fast        : Boolean := True)
     --  with SPARK_Mode => Off
   is
      pragma Unreferenced (Fast);
      DX     : constant Float := abs Float (Stop.X - Start.X);
      DY     : constant Float := abs Float (Stop.Y - Start.Y);
      Err    : Float;
      X      : Natural := Start.X;
      Y      : Natural := Start.Y;
      Step_X : Integer := 1;
      Step_Y : Integer := 1;

      procedure Draw_Point (P : Point) with Inline
        ,
        Pre => P.X <= Screen_Width - Thickness
        and then P.Y <= Screen_Height - Thickness
        and then P.X - (Thickness / 2) >= 0
        and then P.Y - (Thickness / 2) >= 0
      ;

      ----------------
      -- Draw_Point --
      ----------------

      procedure Draw_Point (P : Point) is
      begin
         null;
      end Draw_Point;
      --
      --  X_Init : Natural := X with Ghost;
      --  Y_Init : Natural := Y with Ghost;
      --  Index : Natural := 0 with Ghost;
      Y_Calcul : Natural;
      --  Y_Calcul_Float : Float;

   begin
      if Start.X > Stop.X then
         Step_X := -1;
      end if;

      if Start.Y > Stop.Y then
         Step_Y := -1;
      end if;

      if DX > DY then
         Err := DX / 2.0;
         while X /= Stop.X loop
            pragma Loop_Invariant ( X < Stop.X and then X >= Start.X);
            pragma Loop_Invariant (Y - Start.Y <= Natural (DY) *  (Step_X * Step_Y));
            pragma Loop_Invariant (Y = Natural (Float'Floor (DY / DX * Float (Step_X * (X - Start.X)) + Float (Start.Y) + 0.5)));
      --        Y_Calcul_Float := DY / DX * Float (X - Start.X) + Float (Start.Y) + 0.5;
            Y_Calcul := Natural (Float'Floor (DY / DX * Float (Step_X * Step_Y) * Float (X - Start.X) + Float (Start.Y) + 0.5));
            Put_Line ("X = " & X'Img);
            Put_Line ("Y = " & Y'Img);
      --  Put_Line ("Y Calcul Float = " & Y_Calcul_Float'Img);
            Put_Line ("Y Calcul = " & Y_Calcul'Img);
            Draw_Point ((X, Y));
            Err := Err - DY;
            --  Put_Line ("Err = " & Err'Img);
            if Err < 0.0 then
               Y := Y + Step_Y;
               --  Put_Line ("Y = " & Y'Img);
               Err := Err + DX;
            end if;
            X := X + Step_X;
            --  Put_Line ("X = " & X'Img);
         end loop;
      end if;
      --  Y_Calcul :=  Natural (Float'Floor (DY / DX * Float (X - Start.X) + Float (Start.Y) + 0.5));
      --  Y_Calcul_Float := DY / DX * Float (X - Start.X) + Float (Start.Y) + 0.5;
      --        Put_Line ("X = " & X'Img);
      --        Put_Line ("Y = " & Y'Img);
      --  Put_Line ("Y Calcul Float = " & Y_Calcul_Float'Img);
      --  Put_Line ("Y Calcul = " & Y_Calcul'Img);
      Draw_Point ((X, Y));
   end Draw_Line;

end Test;
