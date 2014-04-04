From: =?ISO-8859-1?Q?Vincent_Stehl=E9?= <vincent.stehle@freescale.com>
Date: Fri, 4 Apr 2014 19:35:13 +0200
Subject: [Buildroot] host-binutils broken?
Message-ID: <533EED51.9090204@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

FYI it seems the following recent commit broke compilation of 
host-binutils (2.22 in my case) when compiling for e.g. 
raspberrypi_defconfig:

   6acb2e1 binutils: backport gas xtensa jump trampolines

If I revert it, host-binutils builds fine.

Best regards,

V.
