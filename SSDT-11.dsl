/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20161210-64(RM)
 * Copyright (c) 2000 - 2016 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-11.aml, Sat Nov 18 15:33:04 2017
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000784 (1924)
 *     Revision         0x01
 *     Checksum         0xCA
 *     OEM ID           "OptRef"
 *     OEM Table ID     "OptTabl"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20161210 (538317328)
 */
DefinitionBlock ("", "SSDT", 1, "OptRef", "OptTabl", 0x00001000)
{
    /*
     * External declarations were imported from
     * a reference file -- refs.txt
     */

    External (_GPE.MMTB, MethodObj)    // Imported: 0 Arguments
    External (_GPE.VHOV, MethodObj)    // Imported: 3 Arguments
    External (_SB_.PCI0, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.GFX0.DD02._BCM, MethodObj)    // Imported: 1 Arguments
    External (_SB_.PCI0.IGPU, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.IGPU._DSM, IntObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.ECMD, MethodObj)    // Imported: 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.ECRD, MethodObj)    // Imported: 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.ECWT, MethodObj)    // Imported: 2 Arguments
    External (_SB_.PCI0.PEG0.PEGP.SGPO, MethodObj)    // Imported: 2 Arguments
    External (_SB_.PCI0.RP05.PEGP, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.RP05.PEGP.SGOF, MethodObj)    // 0 Arguments (from opcode)
    External (_SB_.PCI0.RP05.PEGP.SGON, MethodObj)    // 0 Arguments (from opcode)
    External (_SB_.PCI0.SAT0.SDSM, MethodObj)    // Imported: 4 Arguments
    External (_SB_.PCI0.XHC_.RHUB.TPLD, MethodObj)    // Imported: 2 Arguments
    External (DID1, FieldUnitObj)    // (from opcode)
    External (DID2, FieldUnitObj)    // (from opcode)
    External (DID3, FieldUnitObj)    // (from opcode)
    External (DID4, FieldUnitObj)    // (from opcode)
    External (DID5, FieldUnitObj)    // (from opcode)
    External (DID6, FieldUnitObj)    // (from opcode)
    External (DID7, FieldUnitObj)    // (from opcode)
    External (DID8, FieldUnitObj)    // (from opcode)
    External (EBAS, FieldUnitObj)    // (from opcode)
    External (MDBG, MethodObj)    // Imported: 1 Arguments
    External (NVGA, FieldUnitObj)    // (from opcode)
    External (NVHA, FieldUnitObj)    // (from opcode)
    External (NXD1, FieldUnitObj)    // (from opcode)
    External (NXD2, FieldUnitObj)    // (from opcode)
    External (NXD3, FieldUnitObj)    // (from opcode)
    External (NXD4, FieldUnitObj)    // (from opcode)
    External (NXD5, FieldUnitObj)    // (from opcode)
    External (NXD6, FieldUnitObj)    // (from opcode)
    External (NXD7, FieldUnitObj)    // (from opcode)
    External (NXD8, FieldUnitObj)    // (from opcode)
    External (SGFL, FieldUnitObj)    // (from opcode)
    External (SSMP, FieldUnitObj)    // (from opcode)

    Scope (\_SB.PCI0)
    {
        Name (OTM, "OTMACPI 2010-Mar-09 12:08:26")
    }

    Scope (\_SB.PCI0.RP05.PEGP)
    {
        OperationRegion (PCI2, SystemMemory, EBAS, 0x1000)
        Field (PCI2, DWordAcc, Lock, Preserve)
        {
            Offset (0x04), 
            CMDR,   8, 
            VGAR,   2000, 
            Offset (0x48B), 
                ,   1, 
            NHDA,   1
        }

        Name (VGAB, Buffer (0xFA)
        {
             0x00                                           
        })
        Name (GPRF, Zero)
        OperationRegion (NVHM, SystemMemory, NVHA, 0x00020400)
        Field (NVHM, DWordAcc, NoLock, Preserve)
        {
            NVSG,   128, 
            NVSZ,   32, 
            NVVR,   32, 
            NVHO,   32, 
            RVBS,   32, 
            RBF1,   262144, 
            RBF2,   262144, 
            RBF3,   262144, 
            RBF4,   262144, 
            MXML,   32, 
            MXM3,   1600
        }

        Name (OPCE, 0x02)
        Name (DGPS, Zero)
        Name (_PSC, Zero)  // _PSC: Power State Current
        Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
        {
            Store (Zero, _PSC)
            If (LNotEqual (DGPS, Zero))
            {
                _ON ()
                Store (Zero, DGPS)
            }
        }

        Method (_PS1, 0, NotSerialized)  // _PS1: Power State 1
        {
            Store (One, _PSC)
        }

        Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
        {
            If (LEqual (OPCE, 0x03))
            {
                If (LEqual (DGPS, Zero))
                {
                    _OFF ()
                    Store (One, DGPS)
                }

                Store (0x02, OPCE)
            }

            Store (0x03, _PSC)
        }

        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            Return (0x0F)
        }

        Method (_ROM, 2, NotSerialized)  // _ROM: Read-Only Memory
        {
            Store (Arg0, Local0)
            Store (Arg1, Local1)
            If (LGreater (Local1, 0x1000))
            {
                Store (0x1000, Local1)
            }

            If (LGreater (Local0, 0x00020000))
            {
                Return (Buffer (Local1)
                {
                     0x00                                           
                })
            }

            Multiply (Local1, 0x08, Local3)
            Name (ROM1, Buffer (0x8000)
            {
                 0x00                                           
            })
            Name (ROM2, Buffer (Local1)
            {
                 0x00                                           
            })
            If (LLess (Local0, 0x8000))
            {
                Store (RBF1, ROM1)
            }
            ElseIf (LLess (Local0, 0x00010000))
            {
                Subtract (Local0, 0x8000, Local0)
                Store (RBF2, ROM1)
            }
            ElseIf (LLess (Local0, 0x00018000))
            {
                Subtract (Local0, 0x00010000, Local0)
                Store (RBF3, ROM1)
            }
            ElseIf (LLess (Local0, 0x00020000))
            {
                Subtract (Local0, 0x00018000, Local0)
                Store (RBF4, ROM1)
            }

            Multiply (Local0, 0x08, Local2)
            CreateField (ROM1, Local2, Local3, TMPB)
            Store (TMPB, ROM2)
            Return (ROM2)
        }

        Name (CTXT, Zero)
        Method (_ON, 0, Serialized)  // _ON_: Power On
        {
            SGON ()
            If (LNotEqual (GPRF, One))
            {
                Store (CMDR, Local0)
                Store (Zero, CMDR)
                Store (VGAB, VGAR)
                Store (0x06, CMDR)
                If (LEqual (And (SGFL, 0x02), Zero))
                {
                    Store (Zero, NHDA)
                }

                Store (Local0, CMDR)
            }

            Store (0xB7, SSMP)
        }

        Method (_OFF, 0, Serialized)  // _OFF: Power Off
        {
            If (LEqual (CTXT, Zero))
            {
                If (LNotEqual (GPRF, One))
                {
                    Store (VGAR, VGAB)
                }

                Store (One, CTXT)
            }

            SGOF ()
        }
    }

    Scope (\_SB.PCI0.IGPU)
    {
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            Store (DID1, Index (TLPK, Zero))
            Store (DID2, Index (TLPK, 0x02))
            Store (DID3, Index (TLPK, 0x04))
            Store (DID4, Index (TLPK, 0x06))
            Store (DID5, Index (TLPK, 0x08))
            Store (DID6, Index (TLPK, 0x0A))
            Store (DID7, Index (TLPK, 0x0C))
            Store (DID2, Index (TLPK, 0x0E))
            Store (DID1, Index (TLPK, 0x0F))
            Store (DID2, Index (TLPK, 0x11))
            Store (DID3, Index (TLPK, 0x12))
            Store (DID2, Index (TLPK, 0x14))
            Store (DID4, Index (TLPK, 0x15))
            Store (DID2, Index (TLPK, 0x17))
            Store (DID5, Index (TLPK, 0x18))
            Store (DID2, Index (TLPK, 0x1A))
            Store (DID6, Index (TLPK, 0x1B))
            Store (DID2, Index (TLPK, 0x1D))
            Store (DID7, Index (TLPK, 0x1E))
        }

        OperationRegion (NVIG, SystemMemory, NVGA, 0x45)
        Field (NVIG, DWordAcc, NoLock, Preserve)
        {
            NISG,   128, 
            NISZ,   32, 
            NIVR,   32, 
            GPSS,   32, 
            GACD,   16, 
            GATD,   16, 
            LDES,   8, 
            DKST,   8, 
            DACE,   8, 
            DHPE,   8, 
            DHPS,   8, 
            SGNC,   8, 
            GPPO,   8, 
            USPM,   8, 
            GPSP,   8, 
            TLSN,   8, 
            FDOS,   8, 
            ELCL,   16
        }

        Name (TLPK, Package (0x20)
        {
            Ones, 
            0x2C, 
            Ones, 
            0x2C, 
            Ones, 
            0x2C, 
            Ones, 
            0x2C, 
            Ones, 
            0x2C, 
            Ones, 
            0x2C, 
            Ones, 
            0x2C, 
            Ones, 
            Ones, 
            0x2C, 
            Ones, 
            Ones, 
            0x2C, 
            Ones, 
            Ones, 
            0x2C, 
            Ones, 
            Ones, 
            0x2C, 
            Ones, 
            Ones, 
            0x2C, 
            Ones, 
            Ones, 
            0x2C
        })
        Method (INDL, 0, Serialized)
        {
            Store (Zero, NXD1)
            Store (Zero, NXD2)
            Store (Zero, NXD3)
            Store (Zero, NXD4)
            Store (Zero, NXD5)
            Store (Zero, NXD6)
            Store (Zero, NXD7)
            Store (Zero, NXD8)
        }

        Method (SND1, 1, Serialized)
        {
            If (LEqual (Arg0, DID1))
            {
                Store (One, NXD1)
            }

            If (LEqual (Arg0, DID2))
            {
                Store (One, NXD2)
            }

            If (LEqual (Arg0, DID3))
            {
                Store (One, NXD3)
            }

            If (LEqual (Arg0, DID4))
            {
                Store (One, NXD4)
            }

            If (LEqual (Arg0, DID5))
            {
                Store (One, NXD5)
            }

            If (LEqual (Arg0, DID6))
            {
                Store (One, NXD6)
            }

            If (LEqual (Arg0, DID7))
            {
                Store (One, NXD7)
            }

            If (LEqual (Arg0, DID8))
            {
                Store (One, NXD8)
            }
        }

        Method (SNXD, 1, Serialized)
        {
            INDL ()
            Store (One, Local0)
            Store (Zero, Local1)
            While (LLess (Local0, Arg0))
            {
                If (LEqual (DerefOf (Index (TLPK, Local1)), 0x2C))
                {
                    Increment (Local0)
                }

                Increment (Local1)
            }

            SND1 (DerefOf (Index (TLPK, Local1)))
            Increment (Local1)
            If (LNotEqual (DerefOf (Index (TLPK, Local1)), 0x2C))
            {
                SND1 (DerefOf (Index (TLPK, Local1)))
            }
        }

        Method (CTOI, 1, Serialized)
        {
            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
            While (One)
            {
                Store (ToInteger (Arg0), _T_0)
                If (LEqual (_T_0, One))
                {
                    Return (One)
                }
                ElseIf (LEqual (_T_0, 0x02))
                {
                    Return (0x02)
                }
                ElseIf (LEqual (_T_0, 0x04))
                {
                    Return (0x03)
                }
                ElseIf (LEqual (_T_0, 0x08))
                {
                    Return (0x04)
                }
                ElseIf (LEqual (_T_0, 0x10))
                {
                    Return (0x05)
                }
                ElseIf (LEqual (_T_0, 0x20))
                {
                    Return (0x06)
                }
                ElseIf (LEqual (_T_0, 0x40))
                {
                    Return (0x07)
                }
                ElseIf (LEqual (_T_0, 0x03))
                {
                    Return (0x08)
                }
                ElseIf (LEqual (_T_0, 0x06))
                {
                    Return (0x09)
                }
                ElseIf (LEqual (_T_0, 0x0A))
                {
                    Return (0x0A)
                }
                ElseIf (LEqual (_T_0, 0x12))
                {
                    Return (0x0B)
                }
                ElseIf (LEqual (_T_0, 0x22))
                {
                    Return (0x0C)
                }
                ElseIf (LEqual (_T_0, 0x42))
                {
                    Return (0x0D)
                }
                Else
                {
                    Return (One)
                }

                Break
            }
        }
    }

    Scope (\_SB.PCI0)
    {
    }
}

