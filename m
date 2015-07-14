From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jul 2015 00:09:33 +0200
Subject: [Buildroot] [PATCH v4 3/7] boot/uboot: Add support for dtb.img
 format
In-Reply-To: <20150714171401.117b8fec@pcviktorin.fit.vutbr.cz>
References: <20150714171214.706e9e4d@pcviktorin.fit.vutbr.cz>
 <20150714171401.117b8fec@pcviktorin.fit.vutbr.cz>
Message-ID: <20150715000933.02bf02d7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jan Viktorin,

On Tue, 14 Jul 2015 17:14:01 +0200, Jan Viktorin wrote:
> Allow to generate u-boot-dtb.img. This is the same format
> as u-boot.img, however, it contains a built-in device-tree.
> This file is being loaded by the U-Boot SPL.
> 
> Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
> ---
>  boot/uboot/Config.in | 3 +++
>  boot/uboot/uboot.mk  | 2 ++
>  2 files changed, 5 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
