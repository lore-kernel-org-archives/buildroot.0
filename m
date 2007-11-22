From: udmd-eric wann <udmderic@gmail.com>
Date: Thu, 22 Nov 2007 22:39:38 +0800
Subject: [Buildroot] Wrong Image/zImage for arm 926T toolchain?
Message-ID: <46361d9e0711220639l7b064ae6nd1db1814b774908e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sir/Madam:

       I am a newbie of buildroot. If I ask a stupid question, please
forgive me.
       I download the newest snapshot of buildroot and I choice
ARM/926T/OABI as my target toolchain. All other options are default
without changed. After make, I can build a cross-compiler tool. When I
use the toolchain to build linux kernel (2.6.23.6), I get a strange
zImage...

       The new toolchain build the kernel "vmlinux" is only about 1M
       However, I find linux-2.6.23/arch/arm/bootp/Image is very large
       and zImage is >3M ....

       If I use my previous toolchain, the output zImage is only 500K...
       I guest my objectcopy is wrong...
       What's wrong with my setting? Could anybody give me a hint...


   Best Regards
   Eric Wann
