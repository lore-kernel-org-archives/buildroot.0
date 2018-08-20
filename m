From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 16:10:15 +0200
Subject: [Buildroot] [PATCH 0/7 v4] core/pkg-kconfig: ensure we have
 necessary tools to run configurators
In-Reply-To: <cover.1534522005.git.yann.morin.1998@free.fr>
References: <cover.1534522005.git.yann.morin.1998@free.fr>
Message-ID: <20180820161015.3e60c741@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 17 Aug 2018 18:06:50 +0200, Yann E. MORIN wrote:

> Yann E. MORIN (7):
>       linux: explain why we need host-{flex,bison}
>       support/dependencies: check for system-provided bison and flex
>       core/pkg-kconfig: allow dependencies before configurators
>       linux: kconfig may need host-{flex,bison} to build the configurators
>       linux: host-{flex,bison} only needed for DTS
>       linux: kconfig needs the toolchain
>       boot/uboot: needs host-{flex,bison}

Series applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
