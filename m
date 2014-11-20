From: Dwayne Fontenot <dwayne.fontenot@att.net> <dwayne.fontenot@att.net>
Date: Thu, 20 Nov 2014 08:41:16 -0800
Subject: [Buildroot] [RFC PATCH 0/2] Add Freescale e5500 & e6500 support
Message-ID: <1416501676.36864.YahooMailBasic@web184905.mail.gq1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo Zacarias <gustavo@...> writes:

>
> This patchset enables internal toolchain builds for Freescale e5500
> and e6500 cores.
> It's only built-tested to generate a 32 and 64-bit toolchains
> with a basic busybox binary and libraries.
>
> Feedback welcome, free kits to test as well :)
>
> Gustavo Zacarias (2):
>   arch/powerpc: add fsl e5500 and e6500 support
>   package/gcc: set e5500 and e6500 version mask
>
>  arch/Config.in.powerpc     | 7 +++++++
>  package/gcc/Config.in.host | 6 ++++--
>  2 files changed, 11 insertions(+), 2 deletions(-)
>

Tested-by: Dwayne Fontenot

I applied the patches and built a working 64-bit rootfs for my T1040RDB (e5500) board.

I also built a working 64-bit kernel using the buildroot toolchain for the same board.

linuxjacques
