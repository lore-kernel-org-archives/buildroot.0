From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Jul 2014 14:34:28 +0200
Subject: [Buildroot] [PATCH] binutils: fix xtensa ld segfault on linking
 linux modules
In-Reply-To: <1405009513-23772-1-git-send-email-jcmvbkbc@gmail.com>
References: <1405009513-23772-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20140712143428.37228213@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Thu, 10 Jul 2014 20:25:13 +0400, Max Filippov wrote:
> This fixes the following build error reproducible with any linux kernel
> module built with a recent buildroot toolchain:
> 
>   LD [M]  fs/jbd2/jbd2.ko
>   /bin/sh: line 1: 12069 Segmentation fault
>   buildroot/host/usr/bin/xtensa-buildroot-linux-uclibc-ld -r --no-relax
>   -T linux/scripts/module-common.lds --build-id
>   -o fs/jbd2/jbd2.ko fs/jbd2/jbd2.o fs/jbd2/jbd2.mod.o
> 
> Backported from: e7d17e71cdc10a2e81e454ce3b9637f1b2a587f2
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
