From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Fri, 19 Feb 2016 23:53:13 +0100
Subject: [Buildroot] Buildroot for normal PC
Message-ID: <56C79CD9.3010503@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I wanna try some more things with the Wine package in buildroot, but I can't easily setup a testing environment for a PC.
One part is which bootloader to use and how to pack everything together to a bootable USB-Stick, HDD image or CD. (And I didn't found a defconfig for that)...
The other part is about the nvidia-driver, I'll need the legacy one for my card. Can I simply alter the version number in the makefile?
