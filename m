From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Apr 2010 02:16:17 +0200
Subject: [Buildroot] codesourcery as external toolchain
In-Reply-To: <n2k5fbe85791004140147maf9b040cx4f4adeda4ce1c339@mail.gmail.com>
References: <n2k5fbe85791004140147maf9b040cx4f4adeda4ce1c339@mail.gmail.com>
Message-ID: <20100417021617.502e76f8@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Martin,

On Wed, 14 Apr 2010 10:47:39 +0200
Atom Proton <atomx01@gmail.com> wrote:

> How to use codesourcery toolchain
> (http://www.codesourcery.com/downloads/public/gnu_toolchain/arm-uclinuxeabi/arm-2009q1-163-arm-uclinuxeabi-i686-pc-linux-gnu.tar.bz2)
> in buildroot for ARM9 (AT91SAM9260) CPU. Can somebody help me, pleas.

You have to apply my codesourcery-toolchain-support branch [1] to a
recent Buildroot git tree. Hopefully, this branch will be merged soon
and be part of the next 2010.05 release of Buildroot.

Don't hesitate to let me know about your success or failure in using
this patchset.

[1]
http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=codesourcery-toolchain-support

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
