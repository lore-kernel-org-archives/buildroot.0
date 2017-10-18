From: Alejandro Ariel Fachini <alefachinic@gmail.com>
Date: Wed, 18 Oct 2017 17:21:07 -0300
Subject: [Buildroot] [BuildRoot] at91sam9x5ek_defconfig not booting
In-Reply-To: <CAHnuF32_L137ZEr4vGjxRW_MJAR1M_fwO=ER+VJFq_bZakAiow@mail.gmail.com>
References: <CAHnuF31sDH93MRN8nU6kdvfymwD7LOAz56YckWrk-OLSdMx3Qg@mail.gmail.com>
 <20171012220111.301bb3af@windsurf.home>
 <CAHnuF30iK6AQeoZBn3f35q1B5Ff+SG9uGUywzKH--wPp-THVVg@mail.gmail.com>
 <CAHnuF33Z3qQeVr5o1q=K1+OgMDCEhheOQm9qCGO1TpPZrjbeVw@mail.gmail.com>
 <20171013155028.77a75504@windsurf.lan>
 <CAHnuF32_L137ZEr4vGjxRW_MJAR1M_fwO=ER+VJFq_bZakAiow@mail.gmail.com>
Message-ID: <CAHnuF312e-QEzH+GinGo31h5=Zciw-DwhEArY+Yes1JhaPRCqQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello:
Still having this issue cant figure whats going on. Im using default
configuration for sam9x35 nandlfash defconfig.
Please Help.
Thanks

2017-10-13 15:36 GMT-03:00 Alejandro Ariel Fachini <alefachinic@gmail.com>:

> Mr Thomas:
> I made a full new build from tag 2017.08.
>  commands:
>                 make at91sam9x5ek_defconfig
>                 make
>
> I flashed this binaries WITH SAM-BA 2.12 on WINDOWS, because my Ubuntu is
> a VirtualMachine.
>
> I share the results with full flashing Console and Reset After Flashing:
>
>> -I- -- NandFlash SAM-BA applet 2.12 --
>>
>> -I- -- SAM9XX5-EK
>>
>> -I- -- Compiled: Jun 27 2012 13:39:59 --
>>
>> -I- INIT command
>>
>> -I- CHIP ID ad da 10 95 44
>>
>> -I- Nandflash ID is 0x9510DAAD
>>
>> -I-     Nandflash driver initialized
>>
>> -I-     pageSize : 0x800 blockSize : 0x20000 blockNb : 0x800
>>
>> -I-     Nandflash PMECC initialized
>>
>> -I-     End of applet (command : 0 --- status : 0)
>>
>> -I- BATCH ERASE command
>>
>> -I- Erase block from #0 to #256
>>
>> -I- SkipBlockNandFdFlash_EraseBsock: Block is BAD
>>
>> -I- Found block #44 BAD, skip it
>>
>> -I- Batch Erase achieved
>>
>> -I-     End of applet (command : 14 --- status : 0)
>>
>> -I- BATCH ERASE command
>>
>> -I- Erase block from #256 to #512
>>
>> -I- SkipBlockNandFlash_EraseBlock: Block is BAD
>>
>> -I- Found block #415 BAD, skip it
>>
>> -I- Batch Erase achieved
>>
>> -I-     End of applet (command : 14 --- status : 0)
>>
>> -I- BATCH ERASE command
>>
>> -I- Erase block from #512 to #768
>>
>> -I- Batch Erase achieved
>>
>> -I-     End of applet (command : 14 --- status : 0)
>>
>> -I- BATCH ERASE coommand
>>
>> -I- Erase block from #768 to #1024
>>
>> -I- Batch Erase achieved
>>
>> -I-     End of applet (command : 14 --- status : 0)
>>
>> -I- BATCH ERASE command
>>
>> -I- Erase block from #1024 to #1280
>>
>> -I- Batch Erasee achieved
>>
>> -I-     End of applet (command : 14 --- status : 0)
>>
>> -I- BATCH ERASE command
>>
>> -I- Erase block from #1280 to #1536
>>
>> -I- Batch Erase achieved
>>
>> -I-     End of applet (command : 14 --- status : 0)
>>
>> -I- BATCH ERASE command
>>
>> -I- Erase block from #1536 to #1792
>>
>> -I- SkipBlockNandFlash_EraseBlock: Block is BAD
>>
>> -I- Found block #1586 BAD, skip it
>>
>> -I- Batch Erase achieved
>>
>> -I-     End of applet (command : 14 --- status : 0)
>>
>> -I- BATCH ERASE command
>>
>> -I- Erase block from #1792 to #2048
>>
>> -I- Full Erase achieved, erase type is 0
>>
>> -I-     End of applet (command : 14 --- status : 0)
>>
>> -I- SEND BOOT FILE command
>>
>> -I-     End of applet (command : 16 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x40000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x2, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x60000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x3, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x80000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x4, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>> )-I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0xa0000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x5, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>>
>> I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0xc0000, buffer at 0x20010df0, of 0x67e0
>> Bytes
>>
>> -I- WRITE at block 0x6, page 0x0, offset 0x0
>>
>> -I- Retrieve data in block,6
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x180000, buffer at 0x20010df0, of 0x72fc
>> Bytes
>>
>> -I- WRITE at block 0xc, page 0x0, offset 0x0
>>
>> -I- Retrieve data in block,12
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x200000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x10, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x220000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x11, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x240000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x12, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x260000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x13, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x280000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x14, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x2a0000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x15, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x2c0000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x16, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x2e0000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x17, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x300000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x18, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x320000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x19, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x340000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x1a, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x360000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x1b, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x380000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x1c, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x3a0000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x1d, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x3c0000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x1e, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x3e0000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x1f, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x400000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x20, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initializee
>>
>> -I- WRITE arguments : offset 0x420000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x21, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x440000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x22, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x460000, buffer at 0x20010dd0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x23, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x480000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x24, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x4a0000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x25, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x4c0000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x26, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x4e0000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x27, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x500000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x28, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x520000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x29, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x540000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x2a, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x560000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x2b, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x580000, buffer at 0x20010df0, of 0x1a970
>> Bytes
>>
>> -I- WRITE at block 0x2c, page 0x0, offset 0x0
>>
>> -I- Retrieve data in block,44
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x800000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x40, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x820000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x41, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x840000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x42, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x860000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x43, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x880000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x44, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x8a0000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x45, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x8c0000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x46, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x8e0000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x47, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x900000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x48, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x920000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x49, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x940000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x4a, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x960000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x4b, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x980000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x4c, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x9a0000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x4d, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x9c0000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x4e, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0x9e0000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x4f, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0xa00000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x50, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0xa20000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x51, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0xa40000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x52, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0xa60000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x53, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0xa80000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x54, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0xaa0000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x55, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0xac0000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x56, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0xae0000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x57, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0xb00000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x58, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0xb20000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x59, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0xb40000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x5a, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0xb60000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x5b, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> -I- SEND FILE command
>>
>> -I- Pmecc initialized
>>
>> -I- WRITE arguments : offset 0xb80000, buffer at 0x20010df0, of 0x20000
>> Bytes
>>
>> -I- WRITE at block 0x5c, page 0x0, offset 0x0
>>
>> -I-     End of applet (command : 2 --- status : 0)
>>
>> RomBOOT
>>
>>
>>
>> AT91Bootstrap 3.8.7 (lun oct  9 13:46:05 ART 2017)
>>
>> 1-Wire: Loading 1-Wire information ...
>> 1-Wire: ROM Searching ... Done, 3 1-Wire chips found
>>
>> 1-Wire: BoardName | [Revid] | VendorName
>>   #0  SAM9x5-EK [B0]      FLEX
>>   #1  SAM9X35-CM [B2]      RONETIX
>>   #2  SAM9x5-DM [B0]      FLEX
>>
>> 1-Wire: Board sn: 0x4010466 revision: 0x10421
>>
>> NAND: ONFI flash detected
>> NAND: ONFI para CRC error!
>> NAND: Manufacturer ID: 0xad Chip ID: 0xda
>> WARNING: Fail to disable On-Die ECC
>> Nand flash is not ONFI compliant, use 2-bit/512-byte ecc.
>> NAND: Initialize PMECC params, cap: 2, sector: 512
>> NAND: Image: Copy 0x80000 bytes from 0x40000 to 0x26f00000
>> NAND: Done to load image
>> <debug_uart> No serial driver found
>> resetting ...
>> RomBOOT
>>
>>
>>
>> AT91Bootstrap 3.8.7 (lun oct  9 13:46:05 ART 2017)
>>
>> 1-Wire: Loading 1-Wire information ...
>> 1-Wire: ROM Searching ... Done, 3 1-Wire chips found
>>
>> 1-Wire: BoardName | [Revid] | VendorName
>>   #0  SAM9x5-EK [B0]      FLEX
>>   #1  SAM9X35-CM [B2]      RONETIX
>>   #2  SAM9x5-DM [B0]      FLEX
>>
>> 1-Wire: Board sn: 0x4010466 revision: 0x10421
>>
>> NAND: ONFI flash detected
>> NAND: ONFI para CRC error!
>> NAND: Manufacturer ID: 0xad Chip ID: 0xda
>> WARNING: Fail to disable On-Die ECC
>> Nand flash is not ONFI compliant, use 2-bit/512-byte ecc.
>> NAND: Initialize PMECC params, cap: 2, sector: 512
>> NAND: Image: Copy 0x80000 bytes from 0x40000 to 0x26f00000
>> NAND: Done to load image
>> <debug_uart> No serial driver found
>> resetting ...
>> RomBOOT
>>
>>
>>
>> AT91Bootstrap 3.8.7 (lun oct  9 13:46:05 ART 2017)
>>
>> 1-Wire: Loading 1-Wire information ...
>> 1-Wire: ROM Searching ... Done, 3 1-Wire chips found
>>
>> 1-Wire: BoardName | [Revid] | VendorName
>>   #0  SAM9x5-EK [B0]      FLEX
>>   #1  SAM9X35-CM [B2]      RONETIX
>>   #2  SAM9x5-DM [B0]      FLEX
>>
>> 1-Wire: Board sn: 0x4010466 revision: 0x10421
>>
>> NAND: ONFI flash detected
>> NAND: ONFI para CRC error!
>> NAND: Manufacturer ID: 0xad Chip ID: 0xda
>> WARNING: Fail to disable On-Die ECC
>> Nand flash is not ONFI compliant, use 2-bit/512-byte ecc.
>> NAND: Initialize PMECC params, cap: 2, sector: 512
>> NAND: Image: Copy 0x80000 bytes from 0x40000 to 0x26f00000
>> NAND: Done to load image
>> <debug_uart> No serial driver found
>> resetting ...
>> RomBOOT
>>
>
>
> IMPORTANT: I tried also flashing with a *.bat invoking the nandflash.tcl
> script, but it seems that its not directly compatible with windows since it
> wont find the paths to the files. But it wont work.
>
> As i see now the problem is in U-boot default config???
>
> 2017-10-13 10:50 GMT-03:00 Thomas Petazzoni <thomas.petazzoni@free-
> electrons.com>:
>
>> Hello,
>>
>> On Fri, 13 Oct 2017 09:44:06 -0300, Alejandro Ariel Fachini wrote:
>>
>> > Thanks For your help. I used the tag 2017.03 and Still got the same
>> Result
>>
>> There is no 2017.03 tag, so this is not possible.
>>
>> > in fact the first thing i did was use the latest version of BuildRoot.
>> >  If i understand correctly:
>> > At first Boot after Install binaries i should set environment variables,
>>
>> No, the default environment variables set inside the U-Boot binary
>> should be good enough.
>>
>> > How do I make the boot into Kernel auomatic? I believe all tthis is
>> U-Boot
>> > Related? If thats so just tell me and i wont bother anymore.
>>
>> This is all U-Boot related of course. Please read the materials that I
>> pointed in my previous e-mail. And as I said, the default U-Boot
>> environment should automatically load and boot a Linux kernel, if I
>> remember correctly.
>>
>> Best regards,
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux and Kernel engineering
>> http://free-electrons.com
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171018/f81ed5ca/attachment.html>
