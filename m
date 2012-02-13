From: universeII at gmx.de <universeII@gmx.de>
Date: Mon, 13 Feb 2012 22:05:52 +0100
Subject: [Buildroot] Bug/Typo in ffmpeg.mk
Message-ID: <20120213210552.192510@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi buildroot guys,
I just found the buildroot project due to a magazine article and I'm really impressed how simple cross compiling is using this tool.

I'm trying to create a system for a 7400 power-pc and I think I found a typo in
/package/multimedia/ffmpeg/ffmpeg.mk

line 148 is:
FFMPEG_CONF_OPT -= --enable-altivec

but should be:
FFMPEG_CONF_OPT += --enable-altivec

My first step is to try running the new kernel/system in qemu, but I'm not sure which option to parameter -M is the correct one for the 7400 CPU.

qemu help gives me the following options:

> qemu-system-ppc -M ?
Supported machines are:
virtex-ml507 Xilinx Virtex ML507 reference design
mpc8544ds  mpc8544ds
bamboo     bamboo (alias of bamboo-0.13)
bamboo-0.13 bamboo
bamboo-0.12 bamboo
ref405ep   ref405ep
taihu      taihu
mac99      Mac99 based PowerMAC
g3beige    Heathrow based PowerMAC (default)
prep       PowerPC PREP platform

Can anyone give me a hint?

Regards,
Andreas
-- 
Empfehlen Sie GMX DSL Ihren Freunden und Bekannten und wir
belohnen Sie mit bis zu 50,- Euro! https://freundschaftswerbung.gmx.de
