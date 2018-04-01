From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 08:46:15 +0200
Subject: [Buildroot] [PATCH v2 11/37] linux/linux.mk: use namespace for
 internal variables
In-Reply-To: <20180401050850.5701-12-ricardo.martincoski@gmail.com>
References: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
 <20180401050850.5701-12-ricardo.martincoski@gmail.com>
Message-ID: <20180401084615.1eeac5ed@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Apr 2018 02:08:24 -0300, Ricardo Martincoski wrote:
> These three symbols:
> KERNEL_ARCH_PATH
> KERNEL_DTBS
> KERNEL_DTS_NAME
> are defined and used only inside this file, so use the LINUX_ namespace
> for them instead of KERNEL_.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> Changes v1 -> v2:
>   - use prefix LINUX_ instead of LINUX_KERNEL_  (suggested by Thomas
>     Petazzoni);
>   - rebased;
> ---
>  linux/linux.mk | 38 +++++++++++++++++++-------------------
>  1 file changed, 19 insertions(+), 19 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
