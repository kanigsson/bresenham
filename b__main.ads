pragma Warnings (Off);
pragma Ada_95;
with System;
with System.Parameters;
with System.Secondary_Stack;
package ada_main is

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: Pro 24.0w (20230514-123)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   GNAT_Version_Address : constant System.Address := GNAT_Version'Address;
   pragma Export (C, GNAT_Version_Address, "__gnat_version_address");

   Ada_Main_Program_Name : constant String := "_ada_main" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#e2343f9b#;
   pragma Export (C, u00001, "mainB");
   u00002 : constant Version_32 := 16#30305195#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#0626cc96#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#686d3e0b#;
   pragma Export (C, u00004, "bresenhamB");
   u00005 : constant Version_32 := 16#d8f3160b#;
   pragma Export (C, u00005, "bresenhamS");
   u00006 : constant Version_32 := 16#76789da1#;
   pragma Export (C, u00006, "adaS");
   u00007 : constant Version_32 := 16#a201b8c5#;
   pragma Export (C, u00007, "ada__strings__text_buffersB");
   u00008 : constant Version_32 := 16#a7cfd09b#;
   pragma Export (C, u00008, "ada__strings__text_buffersS");
   u00009 : constant Version_32 := 16#e6d4fa36#;
   pragma Export (C, u00009, "ada__stringsS");
   u00010 : constant Version_32 := 16#14286b0f#;
   pragma Export (C, u00010, "systemS");
   u00011 : constant Version_32 := 16#c71e6c8a#;
   pragma Export (C, u00011, "system__exception_tableB");
   u00012 : constant Version_32 := 16#99031d16#;
   pragma Export (C, u00012, "system__exception_tableS");
   u00013 : constant Version_32 := 16#fd5f5f4c#;
   pragma Export (C, u00013, "system__soft_linksB");
   u00014 : constant Version_32 := 16#88b6a55b#;
   pragma Export (C, u00014, "system__soft_linksS");
   u00015 : constant Version_32 := 16#f3070507#;
   pragma Export (C, u00015, "system__secondary_stackB");
   u00016 : constant Version_32 := 16#1bab4200#;
   pragma Export (C, u00016, "system__secondary_stackS");
   u00017 : constant Version_32 := 16#706a20cf#;
   pragma Export (C, u00017, "ada__exceptionsB");
   u00018 : constant Version_32 := 16#a933b8b5#;
   pragma Export (C, u00018, "ada__exceptionsS");
   u00019 : constant Version_32 := 16#0740df23#;
   pragma Export (C, u00019, "ada__exceptions__last_chance_handlerB");
   u00020 : constant Version_32 := 16#6dc27684#;
   pragma Export (C, u00020, "ada__exceptions__last_chance_handlerS");
   u00021 : constant Version_32 := 16#268dd43d#;
   pragma Export (C, u00021, "system__exceptionsS");
   u00022 : constant Version_32 := 16#69416224#;
   pragma Export (C, u00022, "system__exceptions__machineB");
   u00023 : constant Version_32 := 16#8bdfdbe3#;
   pragma Export (C, u00023, "system__exceptions__machineS");
   u00024 : constant Version_32 := 16#7706238d#;
   pragma Export (C, u00024, "system__exceptions_debugB");
   u00025 : constant Version_32 := 16#2426335c#;
   pragma Export (C, u00025, "system__exceptions_debugS");
   u00026 : constant Version_32 := 16#64abb467#;
   pragma Export (C, u00026, "system__img_intS");
   u00027 : constant Version_32 := 16#f2c63a02#;
   pragma Export (C, u00027, "ada__numericsS");
   u00028 : constant Version_32 := 16#174f5472#;
   pragma Export (C, u00028, "ada__numerics__big_numbersS");
   u00029 : constant Version_32 := 16#ee021456#;
   pragma Export (C, u00029, "system__unsigned_typesS");
   u00030 : constant Version_32 := 16#08caf301#;
   pragma Export (C, u00030, "system__val_intS");
   u00031 : constant Version_32 := 16#1ed4e335#;
   pragma Export (C, u00031, "system__val_unsS");
   u00032 : constant Version_32 := 16#47d9a892#;
   pragma Export (C, u00032, "system__sparkS");
   u00033 : constant Version_32 := 16#812db2df#;
   pragma Export (C, u00033, "system__spark__cut_operationsB");
   u00034 : constant Version_32 := 16#46c019b4#;
   pragma Export (C, u00034, "system__spark__cut_operationsS");
   u00035 : constant Version_32 := 16#96e09402#;
   pragma Export (C, u00035, "system__val_utilB");
   u00036 : constant Version_32 := 16#27edbf82#;
   pragma Export (C, u00036, "system__val_utilS");
   u00037 : constant Version_32 := 16#b98923bf#;
   pragma Export (C, u00037, "system__case_utilB");
   u00038 : constant Version_32 := 16#db3bbc5a#;
   pragma Export (C, u00038, "system__case_utilS");
   u00039 : constant Version_32 := 16#db4759b4#;
   pragma Export (C, u00039, "system__wid_unsS");
   u00040 : constant Version_32 := 16#79bec7e4#;
   pragma Export (C, u00040, "system__storage_elementsS");
   u00041 : constant Version_32 := 16#5c7d9c20#;
   pragma Export (C, u00041, "system__tracebackB");
   u00042 : constant Version_32 := 16#92b29fb2#;
   pragma Export (C, u00042, "system__tracebackS");
   u00043 : constant Version_32 := 16#5f6b6486#;
   pragma Export (C, u00043, "system__traceback_entriesB");
   u00044 : constant Version_32 := 16#dc34d483#;
   pragma Export (C, u00044, "system__traceback_entriesS");
   u00045 : constant Version_32 := 16#367b1dc5#;
   pragma Export (C, u00045, "system__traceback__symbolicB");
   u00046 : constant Version_32 := 16#d9e66ad1#;
   pragma Export (C, u00046, "system__traceback__symbolicS");
   u00047 : constant Version_32 := 16#179d7d28#;
   pragma Export (C, u00047, "ada__containersS");
   u00048 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00048, "ada__exceptions__tracebackB");
   u00049 : constant Version_32 := 16#eb07882c#;
   pragma Export (C, u00049, "ada__exceptions__tracebackS");
   u00050 : constant Version_32 := 16#15f799c2#;
   pragma Export (C, u00050, "interfacesS");
   u00051 : constant Version_32 := 16#20329446#;
   pragma Export (C, u00051, "interfaces__cB");
   u00052 : constant Version_32 := 16#bd296326#;
   pragma Export (C, u00052, "interfaces__cS");
   u00053 : constant Version_32 := 16#a43efea2#;
   pragma Export (C, u00053, "system__parametersB");
   u00054 : constant Version_32 := 16#21bf971e#;
   pragma Export (C, u00054, "system__parametersS");
   u00055 : constant Version_32 := 16#a830006e#;
   pragma Export (C, u00055, "system__bounded_stringsB");
   u00056 : constant Version_32 := 16#63d54a16#;
   pragma Export (C, u00056, "system__bounded_stringsS");
   u00057 : constant Version_32 := 16#d3506f7d#;
   pragma Export (C, u00057, "system__crtlS");
   u00058 : constant Version_32 := 16#933b5a4c#;
   pragma Export (C, u00058, "system__dwarf_linesB");
   u00059 : constant Version_32 := 16#f38e5e19#;
   pragma Export (C, u00059, "system__dwarf_linesS");
   u00060 : constant Version_32 := 16#5b4659fa#;
   pragma Export (C, u00060, "ada__charactersS");
   u00061 : constant Version_32 := 16#f70a517e#;
   pragma Export (C, u00061, "ada__characters__handlingB");
   u00062 : constant Version_32 := 16#ea6baced#;
   pragma Export (C, u00062, "ada__characters__handlingS");
   u00063 : constant Version_32 := 16#cde9ea2d#;
   pragma Export (C, u00063, "ada__characters__latin_1S");
   u00064 : constant Version_32 := 16#37fac31e#;
   pragma Export (C, u00064, "ada__strings__mapsB");
   u00065 : constant Version_32 := 16#9df1863a#;
   pragma Export (C, u00065, "ada__strings__mapsS");
   u00066 : constant Version_32 := 16#96b40646#;
   pragma Export (C, u00066, "system__bit_opsB");
   u00067 : constant Version_32 := 16#d9dbc733#;
   pragma Export (C, u00067, "system__bit_opsS");
   u00068 : constant Version_32 := 16#4642cba6#;
   pragma Export (C, u00068, "ada__strings__maps__constantsS");
   u00069 : constant Version_32 := 16#a0d3d22b#;
   pragma Export (C, u00069, "system__address_imageB");
   u00070 : constant Version_32 := 16#b5c4f635#;
   pragma Export (C, u00070, "system__address_imageS");
   u00071 : constant Version_32 := 16#9bb2f5cd#;
   pragma Export (C, u00071, "system__img_unsS");
   u00072 : constant Version_32 := 16#20ec7aa3#;
   pragma Export (C, u00072, "system__ioB");
   u00073 : constant Version_32 := 16#8a6a9c40#;
   pragma Export (C, u00073, "system__ioS");
   u00074 : constant Version_32 := 16#e15ca368#;
   pragma Export (C, u00074, "system__mmapB");
   u00075 : constant Version_32 := 16#f9386e18#;
   pragma Export (C, u00075, "system__mmapS");
   u00076 : constant Version_32 := 16#367911c4#;
   pragma Export (C, u00076, "ada__io_exceptionsS");
   u00077 : constant Version_32 := 16#dd82c35a#;
   pragma Export (C, u00077, "system__mmap__os_interfaceB");
   u00078 : constant Version_32 := 16#37fd3b64#;
   pragma Export (C, u00078, "system__mmap__os_interfaceS");
   u00079 : constant Version_32 := 16#eb02212c#;
   pragma Export (C, u00079, "system__mmap__unixS");
   u00080 : constant Version_32 := 16#659ae85f#;
   pragma Export (C, u00080, "system__os_libB");
   u00081 : constant Version_32 := 16#ee44bb50#;
   pragma Export (C, u00081, "system__os_libS");
   u00082 : constant Version_32 := 16#6e5d049a#;
   pragma Export (C, u00082, "system__atomic_operations__test_and_setB");
   u00083 : constant Version_32 := 16#57acee8e#;
   pragma Export (C, u00083, "system__atomic_operations__test_and_setS");
   u00084 : constant Version_32 := 16#d34b112a#;
   pragma Export (C, u00084, "system__atomic_operationsS");
   u00085 : constant Version_32 := 16#29cc6115#;
   pragma Export (C, u00085, "system__atomic_primitivesB");
   u00086 : constant Version_32 := 16#865a22c3#;
   pragma Export (C, u00086, "system__atomic_primitivesS");
   u00087 : constant Version_32 := 16#256dbbe5#;
   pragma Export (C, u00087, "system__stringsB");
   u00088 : constant Version_32 := 16#8faa6b17#;
   pragma Export (C, u00088, "system__stringsS");
   u00089 : constant Version_32 := 16#8209af78#;
   pragma Export (C, u00089, "system__object_readerB");
   u00090 : constant Version_32 := 16#03b17f04#;
   pragma Export (C, u00090, "system__object_readerS");
   u00091 : constant Version_32 := 16#81a54495#;
   pragma Export (C, u00091, "system__val_lliS");
   u00092 : constant Version_32 := 16#3c1b31df#;
   pragma Export (C, u00092, "system__val_lluS");
   u00093 : constant Version_32 := 16#bad10b33#;
   pragma Export (C, u00093, "system__exception_tracesB");
   u00094 : constant Version_32 := 16#f8b00269#;
   pragma Export (C, u00094, "system__exception_tracesS");
   u00095 : constant Version_32 := 16#fd158a37#;
   pragma Export (C, u00095, "system__wch_conB");
   u00096 : constant Version_32 := 16#cd2b486c#;
   pragma Export (C, u00096, "system__wch_conS");
   u00097 : constant Version_32 := 16#5c289972#;
   pragma Export (C, u00097, "system__wch_stwB");
   u00098 : constant Version_32 := 16#e03a646d#;
   pragma Export (C, u00098, "system__wch_stwS");
   u00099 : constant Version_32 := 16#f8305de6#;
   pragma Export (C, u00099, "system__wch_cnvB");
   u00100 : constant Version_32 := 16#cbeb821c#;
   pragma Export (C, u00100, "system__wch_cnvS");
   u00101 : constant Version_32 := 16#e538de43#;
   pragma Export (C, u00101, "system__wch_jisB");
   u00102 : constant Version_32 := 16#7e5ce036#;
   pragma Export (C, u00102, "system__wch_jisS");
   u00103 : constant Version_32 := 16#0286ce9f#;
   pragma Export (C, u00103, "system__soft_links__initializeB");
   u00104 : constant Version_32 := 16#2ed17187#;
   pragma Export (C, u00104, "system__soft_links__initializeS");
   u00105 : constant Version_32 := 16#8599b27b#;
   pragma Export (C, u00105, "system__stack_checkingB");
   u00106 : constant Version_32 := 16#723f061a#;
   pragma Export (C, u00106, "system__stack_checkingS");
   u00107 : constant Version_32 := 16#8b7604c4#;
   pragma Export (C, u00107, "ada__strings__utf_encodingB");
   u00108 : constant Version_32 := 16#4d0e0994#;
   pragma Export (C, u00108, "ada__strings__utf_encodingS");
   u00109 : constant Version_32 := 16#bb780f45#;
   pragma Export (C, u00109, "ada__strings__utf_encoding__stringsB");
   u00110 : constant Version_32 := 16#b85ff4b6#;
   pragma Export (C, u00110, "ada__strings__utf_encoding__stringsS");
   u00111 : constant Version_32 := 16#d1d1ed0b#;
   pragma Export (C, u00111, "ada__strings__utf_encoding__wide_stringsB");
   u00112 : constant Version_32 := 16#5678478f#;
   pragma Export (C, u00112, "ada__strings__utf_encoding__wide_stringsS");
   u00113 : constant Version_32 := 16#c2b98963#;
   pragma Export (C, u00113, "ada__strings__utf_encoding__wide_wide_stringsB");
   u00114 : constant Version_32 := 16#d7af3358#;
   pragma Export (C, u00114, "ada__strings__utf_encoding__wide_wide_stringsS");
   u00115 : constant Version_32 := 16#354fa445#;
   pragma Export (C, u00115, "ada__tagsB");
   u00116 : constant Version_32 := 16#8bdf2ee3#;
   pragma Export (C, u00116, "ada__tagsS");
   u00117 : constant Version_32 := 16#3548d972#;
   pragma Export (C, u00117, "system__htableB");
   u00118 : constant Version_32 := 16#95f133e4#;
   pragma Export (C, u00118, "system__htableS");
   u00119 : constant Version_32 := 16#1f1abe38#;
   pragma Export (C, u00119, "system__string_hashB");
   u00120 : constant Version_32 := 16#32b4b39b#;
   pragma Export (C, u00120, "system__string_hashS");
   u00121 : constant Version_32 := 16#e58fbb84#;
   pragma Export (C, u00121, "ada__text_ioB");
   u00122 : constant Version_32 := 16#90396ad9#;
   pragma Export (C, u00122, "ada__text_ioS");
   u00123 : constant Version_32 := 16#b4f41810#;
   pragma Export (C, u00123, "ada__streamsB");
   u00124 : constant Version_32 := 16#67e31212#;
   pragma Export (C, u00124, "ada__streamsS");
   u00125 : constant Version_32 := 16#c80780c9#;
   pragma Export (C, u00125, "system__put_imagesB");
   u00126 : constant Version_32 := 16#08866c10#;
   pragma Export (C, u00126, "system__put_imagesS");
   u00127 : constant Version_32 := 16#22b9eb9f#;
   pragma Export (C, u00127, "ada__strings__text_buffers__utilsB");
   u00128 : constant Version_32 := 16#89062ac3#;
   pragma Export (C, u00128, "ada__strings__text_buffers__utilsS");
   u00129 : constant Version_32 := 16#73d2d764#;
   pragma Export (C, u00129, "interfaces__c_streamsB");
   u00130 : constant Version_32 := 16#0225ea2f#;
   pragma Export (C, u00130, "interfaces__c_streamsS");
   u00131 : constant Version_32 := 16#624e7c5a#;
   pragma Export (C, u00131, "system__file_ioB");
   u00132 : constant Version_32 := 16#688aae5a#;
   pragma Export (C, u00132, "system__file_ioS");
   u00133 : constant Version_32 := 16#86c56e5a#;
   pragma Export (C, u00133, "ada__finalizationS");
   u00134 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00134, "system__finalization_rootB");
   u00135 : constant Version_32 := 16#5bda189f#;
   pragma Export (C, u00135, "system__finalization_rootS");
   u00136 : constant Version_32 := 16#ce30f685#;
   pragma Export (C, u00136, "system__file_control_blockS");
   u00137 : constant Version_32 := 16#ca878138#;
   pragma Export (C, u00137, "system__concat_2B");
   u00138 : constant Version_32 := 16#a1d318f8#;
   pragma Export (C, u00138, "system__concat_2S");
   u00139 : constant Version_32 := 16#c3784036#;
   pragma Export (C, u00139, "system__memoryB");
   u00140 : constant Version_32 := 16#0cbcf715#;
   pragma Export (C, u00140, "system__memoryS");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.latin_1%s
   --  interfaces%s
   --  system%s
   --  system.atomic_operations%s
   --  system.io%s
   --  system.io%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.spark%s
   --  system.spark.cut_operations%s
   --  system.spark.cut_operations%b
   --  system.storage_elements%s
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%s
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  system.unsigned_types%s
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%s
   --  system.wch_cnv%b
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.traceback%s
   --  system.traceback%b
   --  ada.characters.handling%s
   --  system.atomic_operations.test_and_set%s
   --  system.case_util%s
   --  system.os_lib%s
   --  system.secondary_stack%s
   --  system.standard_library%s
   --  ada.exceptions%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.soft_links%s
   --  system.val_llu%s
   --  system.val_lli%s
   --  system.val_uns%s
   --  system.val_int%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  ada.exceptions.traceback%s
   --  ada.exceptions.traceback%b
   --  system.address_image%s
   --  system.address_image%b
   --  system.bit_ops%s
   --  system.bit_ops%b
   --  system.bounded_strings%s
   --  system.bounded_strings%b
   --  system.case_util%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.containers%s
   --  ada.io_exceptions%s
   --  ada.numerics%s
   --  ada.numerics.big_numbers%s
   --  ada.strings%s
   --  ada.strings.maps%s
   --  ada.strings.maps%b
   --  ada.strings.maps.constants%s
   --  interfaces.c%s
   --  interfaces.c%b
   --  system.atomic_primitives%s
   --  system.atomic_primitives%b
   --  system.exceptions%s
   --  system.exceptions.machine%s
   --  system.exceptions.machine%b
   --  ada.characters.handling%b
   --  system.atomic_operations.test_and_set%b
   --  system.exception_traces%s
   --  system.exception_traces%b
   --  system.memory%s
   --  system.memory%b
   --  system.mmap%s
   --  system.mmap.os_interface%s
   --  system.mmap%b
   --  system.mmap.unix%s
   --  system.mmap.os_interface%b
   --  system.object_reader%s
   --  system.object_reader%b
   --  system.dwarf_lines%s
   --  system.os_lib%b
   --  system.secondary_stack%b
   --  system.soft_links.initialize%s
   --  system.soft_links.initialize%b
   --  system.soft_links%b
   --  system.standard_library%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  system.wid_uns%s
   --  system.img_int%s
   --  ada.exceptions%b
   --  system.img_uns%s
   --  system.dwarf_lines%b
   --  ada.strings.utf_encoding%s
   --  ada.strings.utf_encoding%b
   --  ada.strings.utf_encoding.strings%s
   --  ada.strings.utf_encoding.strings%b
   --  ada.strings.utf_encoding.wide_strings%s
   --  ada.strings.utf_encoding.wide_strings%b
   --  ada.strings.utf_encoding.wide_wide_strings%s
   --  ada.strings.utf_encoding.wide_wide_strings%b
   --  ada.tags%s
   --  ada.tags%b
   --  ada.strings.text_buffers%s
   --  ada.strings.text_buffers%b
   --  ada.strings.text_buffers.utils%s
   --  ada.strings.text_buffers.utils%b
   --  system.put_images%s
   --  system.put_images%b
   --  ada.streams%s
   --  ada.streams%b
   --  system.file_control_block%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  system.file_io%s
   --  system.file_io%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  bresenham%s
   --  bresenham%b
   --  main%b
   --  END ELABORATION ORDER

end ada_main;
