From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 17:33:36 +0100
Subject: [Buildroot] [PATCH 0/10] kconfig infra: enhancements,
 and more packages migrated (branch yem/pdp/kconfig)
In-Reply-To: <cover.1422972638.git.yann.morin.1998@free.fr>
References: <cover.1422972638.git.yann.morin.1998@free.fr>
Message-ID: <20150214173336.2d17acb3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Thomas,

On Tue,  3 Feb 2015 15:21:46 +0100, Yann E. MORIN wrote:

> Thomas De Schampheleire (9):
>       kconfig infra: support built-in config files
>       kconfig infra: add support for defconfig files
>       kconfig infra: make update-config/defconfig handling symmetrical
>       kconfig infra: remove all install stamp files
>       linux: qstrip the path to the custom configuration file
>       linux: migrate to the kconfig infrastructure
>       linux: avoid unnecessary changes in defconfig for INITRAMFS_SOURCE
>       barebox: qstrip the path to the custom configuration file
>       barebox: migrate to the kconfig infrastructure
> 
> Yann E. Morin (1):
>       kconfig infra: only provide foo-*config targets when the package is enabled

Series applied to next. I've done some changes on two patches: I'll
comment directly on the relevant patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
