From: area234 at gmail.com <area234@gmail.com>
Date: Mon, 27 May 2013 12:33:51 +0200
Subject: [Buildroot] kernel panic on VIA C3 Samuel2
Message-ID: <51A3368F.4010607@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

a root fs built with buildroot-2013.05-rc2 and defconfig BR2_x86_c3=y 
BR2_TOOLCHAIN_EXTERNAL=y, terminates booting with a kernel panic at init 
start, when run on a VIA EPIA PD board with Eden 600+256MB.
The same root fs works fine on qemu and on a netbook (atom n570+1GB). 
This happens with different types of linux kernels and different boot 
loaders.
The problem disappears changing the busybox of buildroot with a 
statically linked one.
What is wrong with the VIA board? Any suggestion is appreciated, thank 
you in advance.

F. Pollastri
