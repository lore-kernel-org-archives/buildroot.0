From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 16:31:49 +0200
Subject: [Buildroot] [PATCH v4 00/36] Remove /usr component from
 HOST_DIR (continued)
In-Reply-To: <20170705111453.2284-1-arnout@mind.be>
References: <20170705111453.2284-1-arnout@mind.be>
Message-ID: <20170705163149.322bd8e9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 5 Jul 2017 13:14:17 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:

> Arnout Vandecappelle (36):
>   generic packages: use $(HOST_DIR) instead of $(HOST_DIR)/usr as prefix
>   Globally replace $(HOST_DIR)/usr/bin with $(HOST_DIR)/bin
>   Globally replace $(HOST_DIR)/usr/sbin with $(HOST_DIR)/sbin
>   Globally replace $(HOST_DIR)/usr/lib with $(HOST_DIR)/lib
>   Globally replace $(HOST_DIR)/usr/include with $(HOST_DIR)/include
>   Globally replace $(HOST_DIR)/usr/share with $(HOST_DIR)/share
>   Globally replace $(HOST_DIR)/usr with $(HOST_DIR)
>   qt: fix up alignment after mechanical replacement
>   boards: replace $HOST_DIR/usr/ with $HOST_DIR/ in scripts
>   chromebook snow: remove $(HOST_DIR)/usr reference from README
>   warpboard: remove $(HOST_DIR)/usr reference from README
>   stm32f429-disco: replace $HOST_DIR/usr with $HOST_DIR in flash script
>   stm32f469-disco: replace $HOST_DIR/usr with $HOST_DIR in flash script
>   eclipse-register-toolchain: toolchain is no longer installed in
>     $(HOST_DIR)/usr
>   manual: remove references to host/usr paths
>   grub2: remove host/usr reference from help text
>   lttng-tools: remove host/usr reference from help text
>   mfgtools: remove host/usr reference from readme.txt
>   lesstif: remove host/usr reference from .mk comment
>   board/gdb/bfin-bf512: remove host/usr reference from readme.txt
>   board/csky: remove host/usr reference from readme.txt
>   libffi: avoid $(HOST_DIR)/usr while moving headers
>   genromfs: use $(HOST_DIR) instead of $(HOST_DIR)/usr as prefix
>   libcap: use $(HOST_DIR) as prefix instead of DESTDIR
>   lzip: use $(HOST_DIR) as prefix instead of DESTDIR
>   opkg-utils: use $(HOST_DIR) as PREFIX instead of DESTDIR
>   raspberrypi-usbboot: remove /usr from DESTDIR-based install commands
>   dos2unix: use prefix instead of DESTDIR for host installation
>   imx-uxb-loader: use prefix instead of DESTDIR for host installation
>   grub2: install in $(HOST_DIR) instead of $(HOST_DIR)/usr
>   sepolgen: strip /usr/ part from HOST_DIR
>   libsemanage: rework host installation
>   libselinux: rework host installation
>   checkpolicy: rework host installation
>   policycoreutils: rework host installation
>   execline: remove --shebangdir configure option

Entire series applied. Let's see what the autobuilders have to say.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
