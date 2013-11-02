From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Nov 2013 16:36:48 +0100
Subject: [Buildroot] [PATCH 1 of 2] Introduction of Amlogic platform to
 buildroot
In-Reply-To: <l5361q$d6q$2@ger.gmane.org>
References: <CADYw_J+dw+E6xCosXu=hOo172ZPu1QJgtVTrHmJEQ2eVa6BWWg@mail.gmail.
 com> <l5361q$d6q$2@ger.gmane.org>
Message-ID: <20131102163648.4e4018a4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stanislav Vasic,

On Sat, 2 Nov 2013 15:34:18 +0000 (UTC), Stanislav Vasic wrote:
> From 5d941e3307401d261b817a3aa40fe75894050419 Mon Sep 17 00:00:00 2001
> From: Stanislav Vasic <svlasic@gmail.com>
> Date: Sat, 2 Nov 2013 14:52:14 +0100
> Subject: [PATCH] Re-add Linaro 2013.04 toolchain
> 
> Linaro 2013.04 toolchain is dependency for Amlogic platform
> because none of current Amlogic kernels are failing to boot
> when compiled with GCC higher than 4.7
> ---
>  toolchain/toolchain-external/Config.in             | 21 +++++++++++++++++
> ++++
>  toolchain/toolchain-external/toolchain-external.mk |  4 ++++
>  2 files changed, 25 insertions(+)

Your entire patch is severely line-wrapped, making it unusable. Can you
use 'git send-email' to send your patches instead?

See
http://buildroot.org/downloads/manual/manual.html#submitting-patches
for details.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
