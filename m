From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 24 Dec 2007 17:47:58 -0200
Subject: [Buildroot] The target/device/Atmel mess
Message-ID: <d6cda7730712241147g3e1edd25jcc11fcece24e4ec9@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi there,

   I'm trying to update the linux kernel to 2.6.23 (plus patches)
based on the Atmel buildroot fork, due to critical fixes that finally
enable booting from the sdcard on the STK1000 (which is the only
available non-network booting method). But then again, there is a big
mess in the Atmel folder. Currently we have:

   arch-avr32/kernel-patches-2.6.2*
   linux/kernel-patches-2.6.2*
   Linux/kernel-patches-2.6.2*

   And possibly others that I haven't found yet.
   Is there any reason for it? Is all of them used? Any of them
deprecated? I added the patches to arch-avr32, to find out that at the
end of the building, build_avr32/linux-2.6.23 didn't have the patches
applied. So, now I'm trying again, but this time I placed the patches
on ALL of those (still building). Is that right?

Kind Regards,
    Thiago A. Correa
