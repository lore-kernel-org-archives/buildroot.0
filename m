From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 28 Mar 2018 16:53:49 -0500
Subject: [Buildroot] Build for sama5d3 mmc doesn't boot
Message-ID: <CANQCQpaS8XOo6QsuBG8XhsD8UJFyf8PMyKisNczqaTDygdAVzA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using buildroot LTS 2018.02


I built the atmel_sama5d3_xplained_mmc_dev_defconfig using the linaro
2017.11 GCC7 toolchain and I only see the following output when I try
to boot from the SDCard.

RomBOOT

AT91Bootstrap 3.8.9 (Wed Mar 28 08:52:16 CDT 2018)



I've kicked off another build defaulting back to a buildroot toolchain
(GCC6.x) and glibc.

-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
