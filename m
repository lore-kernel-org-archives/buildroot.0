From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 25 Apr 2018 08:39:31 +0200
Subject: [Buildroot] [PATCH] boot/uboot: default to kconfig buildsystem
 for latest version
In-Reply-To: <20180424163410.16587-1-yann.morin.1998@free.fr>
References: <20180424163410.16587-1-yann.morin.1998@free.fr>
Message-ID: <20180425063930.jo3ixqrw64gewttb@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

> By default, the builsystem for uboot defaults to 'legacy', while the
> default version is very well capable of using the 'kconfig' buildsystem
> instead.

> Having the 'legacy' buildsystem be the default in that case makes it
> quite inconvenient for users: they would expect to be able to use e.g.
> uboot-menuconfig et al. with the default uboot version.

> Switch to using 'kconfig' when we use the latest version. Keep the
> 'legacy' as default for everything else.

> Also, invert the 'legacy' and 'kconfig' entries in the choice: it is
> nicer to have the recent and future-proodf entry first.

> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: Petr Vorel <petr.vorel@gmail.com>

Good idea :).

Kind regards,
Petr
