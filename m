From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 14:52:34 +0100
Subject: [Buildroot] [PATCH] package/uboot: define help commands when
 using Kconfig
In-Reply-To: <1477991888-27844-1-git-send-email-yann.morin.1998@free.fr>
References: <1477991888-27844-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20161101145234.07918805@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  1 Nov 2016 10:18:08 +0100, Yann E. MORIN wrote:
> Expose the Kconfig-related help commands when U-Boot uses the Kconfig
> configuration. Like others (like Linux, barebox, busybox), only expose
> menuconfig, not all the configurators.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  boot/uboot/uboot.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
