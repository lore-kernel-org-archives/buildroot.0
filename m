From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 11:44:25 +0200
Subject: [Buildroot] [PATCH 0/7 v2] core/kconfig: fix display of custom
 error messages (branch yem/misc)
In-Reply-To: <cover.1436783490.git.yann.morin.1998@free.fr>
References: <cover.1436783490.git.yann.morin.1998@free.fr>
Message-ID: <20150714114425.0a41e86d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 13 Jul 2015 12:32:00 +0200, Yann E. MORIN wrote:

> Yann E. MORIN (7):
>       core/pkg-kconfig: don't enforce check for config file when not building
>       package/linux: don't enforce check for DTS when not building
>       package/linux: check for config file before calling kconfig-package
>       boot/at91boostrap3: check for config file before calling kconfig-package
>       boot/barebox: check for config file before calling kconfig-package
>       package/busybox: check for config file
>       package/uclibc: check for config file

All applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
