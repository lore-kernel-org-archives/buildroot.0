From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Apr 2015 23:11:57 +0200
Subject: [Buildroot] [PATCH 0/5 v2] linux: fix using extensions (branch
 yem/kernel-ext)
In-Reply-To: <cover.1426342904.git.yann.morin.1998@free.fr>
References: <cover.1426342904.git.yann.morin.1998@free.fr>
Message-ID: <20150409231157.0efd1b71@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 14 Mar 2015 15:25:17 +0100, Yann E. MORIN wrote:

> Yann E. MORIN (5):
>       package infra: add patch-dependencies
>       docs/manual: add _PATCH_DEPENDENCIES
>       linux: fix extensions
>       linux: simplify adding new extensions
>       linux: migrate extensions to use the new infrastructure

Thanks a lot, series applied!

I've only done one minor change: in the first patch, I got rid of
show-build-depends and show-patch-depends, and kept only show-depends.

Thanks also to Romain who did review and test the patch series, it was
definitely very useful.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
