------------------------------------------------------------------------------
--                                                                          --
--                         GNAT RUN-TIME COMPONENTS                         --
--                                                                          --
--                     A D A . N U M E R I C S . A U X                      --
--                                                                          --
--                                 S p e c                                  --
--                       (C Library Version, non-x86)                       --
--                                                                          --
--          Copyright (C) 1992-2020, Free Software Foundation, Inc.         --
--                                                                          --
-- GNAT is free software;  you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  GNAT is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.                                     --
--                                                                          --
-- As a special exception under Section 7 of GPL version 3, you are granted --
-- additional permissions described in the GCC Runtime Library Exception,   --
-- version 3.1, as published by the Free Software Foundation.               --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
-- GNAT was originally developed  by the GNAT team at  New York University. --
-- Extensive contributions were provided by Ada Core Technologies Inc.      --
--                                                                          --
------------------------------------------------------------------------------

--  This package provides the basic computational interface for the generic
--  elementary functions. The C library version interfaces with the routines
--  in the C mathematical library, and is thus quite portable, although it may
--  not necessarily meet the requirements for accuracy in the numerics annex.
--  One advantage of using this package is that it will interface directly to
--  hardware instructions, such as the those provided on the Intel x86.

--  This version here is for use with normal Unix math functions. Alternative
--  versions are provided for special situations:

--    a-numaux-darwin    For PowerPC/Darwin (special handling of sin/cos)
--    a-numaux-libc-x86  For the x86, using 80-bit long double format
--    a-numaux-x86       For the x86, using 80-bit long double format with
--                       inline asm statements
--    a-numaux-vxworks   For use on VxWorks (where we have no libm.a library)

package Ada.Numerics.Aux is
   pragma Pure;

   pragma Linker_Options ("-lm");

   type Double is new Long_Float;
   --  Type Double is the type used to call the C routines

   --  We import these functions directly from C. Note that we label them
   --  all as pure functions, because indeed all of them are in fact pure.

   function Sin (X : Double) return Double;
   pragma Import (Intrinsic, Sin, "sin");
   pragma Pure_Function (Sin);

   function Cos (X : Double) return Double;
   pragma Import (Intrinsic, Cos, "cos");
   pragma Pure_Function (Cos);

   function Tan (X : Double) return Double;
   pragma Import (Intrinsic, Tan, "tan");
   pragma Pure_Function (Tan);

   function Exp (X : Double) return Double;
   pragma Import (Intrinsic, Exp, "exp");
   pragma Pure_Function (Exp);

   function Sqrt (X : Double) return Double;
   pragma Import (Intrinsic, Sqrt, "sqrt");
   pragma Pure_Function (Sqrt);

   function Log (X : Double) return Double;
   pragma Import (Intrinsic, Log, "log");
   pragma Pure_Function (Log);

   function Acos (X : Double) return Double;
   pragma Import (Intrinsic, Acos, "acos");
   pragma Pure_Function (Acos);

   function Asin (X : Double) return Double;
   pragma Import (Intrinsic, Asin, "asin");
   pragma Pure_Function (Asin);

   function Atan (X : Double) return Double;
   pragma Import (Intrinsic, Atan, "atan");
   pragma Pure_Function (Atan);

   function Sinh (X : Double) return Double;
   pragma Import (Intrinsic, Sinh, "sinh");
   pragma Pure_Function (Sinh);

   function Cosh (X : Double) return Double;
   pragma Import (Intrinsic, Cosh, "cosh");
   pragma Pure_Function (Cosh);

   function Tanh (X : Double) return Double;
   pragma Import (Intrinsic, Tanh, "tanh");
   pragma Pure_Function (Tanh);

   function Pow (X, Y : Double) return Double;
   pragma Import (Intrinsic, Pow, "pow");
   pragma Pure_Function (Pow);

end Ada.Numerics.Aux;
