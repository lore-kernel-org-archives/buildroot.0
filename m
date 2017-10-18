From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Oct 2017 23:01:47 +0200
Subject: [Buildroot] [BuildRoot] at91sam9x5ek_defconfig not booting
In-Reply-To: <CAHnuF32_L137ZEr4vGjxRW_MJAR1M_fwO=ER+VJFq_bZakAiow@mail.gmail.com>
References: <CAHnuF31sDH93MRN8nU6kdvfymwD7LOAz56YckWrk-OLSdMx3Qg@mail.gmail.com>
 <20171012220111.301bb3af@windsurf.home>
 <CAHnuF30iK6AQeoZBn3f35q1B5Ff+SG9uGUywzKH--wPp-THVVg@mail.gmail.com>
 <CAHnuF33Z3qQeVr5o1q=K1+OgMDCEhheOQm9qCGO1TpPZrjbeVw@mail.gmail.com>
 <20171013155028.77a75504@windsurf.lan>
 <CAHnuF32_L137ZEr4vGjxRW_MJAR1M_fwO=ER+VJFq_bZakAiow@mail.gmail.com>
Message-ID: <20171018230147.42af15dd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 13 Oct 2017 15:36:24 -0300, Alejandro Ariel Fachini wrote:

> > AT91Bootstrap 3.8.7 (lun oct  9 13:46:05 ART 2017)
> >
> > 1-Wire: Loading 1-Wire information ...
> > 1-Wire: ROM Searching ... Done, 3 1-Wire chips found
> >
> > 1-Wire: BoardName | [Revid] | VendorName
> >   #0  SAM9x5-EK [B0]      FLEX
> >   #1  SAM9X35-CM [B2]      RONETIX
> >   #2  SAM9x5-DM [B0]      FLEX
> >
> > 1-Wire: Board sn: 0x4010466 revision: 0x10421
> >
> > NAND: ONFI flash detected
> > NAND: ONFI para CRC error!
> > NAND: Manufacturer ID: 0xad Chip ID: 0xda
> > WARNING: Fail to disable On-Die ECC
> > Nand flash is not ONFI compliant, use 2-bit/512-byte ecc.
> > NAND: Initialize PMECC params, cap: 2, sector: 512
> > NAND: Image: Copy 0x80000 bytes from 0x40000 to 0x26f00000
> > NAND: Done to load image
> > <debug_uart> No serial driver found

This last message looks really weird, and smells like a bogus U-Boot
configuration.

However, you posted in the at91.com forums at
https://www.at91.com/viewtopic.php?f=9&p=49635 and here your boot logs
show U-Boot starting.

I don't have a at91sam9x5ek board at hand to test this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
