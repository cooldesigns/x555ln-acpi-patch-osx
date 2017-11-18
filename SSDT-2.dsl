/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20161210-64(RM)
 * Copyright (c) 2000 - 2016 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-2.aml, Sat Nov 18 15:33:04 2017
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000001ED (493)
 *     Revision         0x01
 *     Checksum         0x8C
 *     OEM ID           "Intel"
 *     OEM Table ID     "zpodd"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20161210 (538317328)
 */
DefinitionBlock ("", "SSDT", 1, "Intel", "zpodd", 0x00001000)
{
    /*
     * External declarations were imported from
     * a reference file -- refs.txt
     */

    External (_GPE.MMTB, MethodObj)    // Imported: 0 Arguments
    External (_GPE.VHOV, MethodObj)    // Imported: 3 Arguments
    External (_SB_.PCI0.GFX0.DD02._BCM, MethodObj)    // Imported: 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.ECMD, MethodObj)    // Imported: 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.ECRD, MethodObj)    // Imported: 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.ECWT, MethodObj)    // Imported: 2 Arguments
    External (_SB_.PCI0.PEG0.PEGP.SGPO, MethodObj)    // Imported: 2 Arguments
    External (_SB_.PCI0.SAT0, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.SAT0.PRT1, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.SAT0.SDSM, MethodObj)    // Imported: 4 Arguments
    External (_SB_.PCI0.XHC_.RHUB.TPLD, MethodObj)    // Imported: 2 Arguments
    External (_SB_.WTGP, MethodObj)    // 2 Arguments (from opcode)
    External (ADBG, MethodObj)    // 1 Arguments (from opcode)
    External (BID_, FieldUnitObj)    // (from opcode)
    External (GO17, FieldUnitObj)    // (from opcode)
    External (MDBG, MethodObj)    // Imported: 1 Arguments
    External (RTD3, FieldUnitObj)    // (from opcode)

    If (LAnd (LOr (LEqual (BID, 0x20), LEqual (BID, 0x24)), LEqual (RTD3, Zero)))
    {
        Scope (\_SB.PCI0.SAT0)
        {
            Scope (PRT1)
            {
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    Name (_T_1, Zero)  // _T_x: Emitted by ASL Compiler
                    Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
                    If (LEqual (Arg0, ToUUID ("bdfaef30-aebb-11de-8a39-0800200c9a66")))
                    {
                        While (One)
                        {
                            Store (ToInteger (Arg2), _T_0)
                            If (LEqual (_T_0, Zero))
                            {
                                ADBG ("Case 0")
                                While (One)
                                {
                                    Store (ToInteger (Arg1), _T_1)
                                    If (LEqual (_T_1, One))
                                    {
                                        Return (Buffer (One)
                                        {
                                             0x0F                                           
                                        })
                                    }
                                    Else
                                    {
                                        Return (Buffer (One)
                                        {
                                             0x00                                           
                                        })
                                    }

                                    Break
                                }
                            }
                            ElseIf (LEqual (_T_0, One))
                            {
                                ADBG ("Enable ZPODD")
                                Return (One)
                            }
                            ElseIf (LEqual (_T_0, 0x02))
                            {
                                ADBG ("Power OFF Device")
                                \_SB.WTGP (0x5A, One)
                                Store (Zero, \GO17)
                                Return (One)
                            }
                            ElseIf (LEqual (_T_0, 0x03))
                            {
                                ADBG ("Power ON Device")
                                \_SB.WTGP (0x5A, Zero)
                                Store (One, \GO17)
                                Sleep (0x0A)
                                Return (One)
                            }
                            Else
                            {
                                Return (Zero)
                            }

                            Break
                        }
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }
            }
        }

        Scope (\_GPE)
        {
            Method (_L11, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                ADBG ("L11 Notify")
                Store (One, \GO17)
                Notify (\_SB.PCI0.SAT0, 0x81)
            }
        }
    }
}

