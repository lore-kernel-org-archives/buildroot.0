From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 19 Oct 2017 13:38:50 +0300
Subject: [Buildroot] [PATCH v3 01/11] board: Add Bananapi M1 support
In-Reply-To: <1508406333-27138-2-git-send-email-jagan@amarulasolutions.com>
References: <1508406333-27138-1-git-send-email-jagan@amarulasolutions.com>
 <1508406333-27138-2-git-send-email-jagan@amarulasolutions.com>
Message-ID: <20171019103850.5ygewsfw6pukbwnv@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jagan,

On Thu, Oct 19, 2017 at 11:45:23AM +0200, Jagan Teki wrote:
> Add initial support for bananapi M1 board with below features:
> - U-Boot 2017.09
> - Linux 4.17

This kernel version has not been released yet.

> - Default packages from buildroot
> 
> Cc: Jason <manager@sinovoip.com.cn>
> Cc: hailymei at banana-pi.com <hailymei@banana-pi.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---

[...]

> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.7"

Seems like you missed a couple of characters in the commit log.

> +BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-bananapi"

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
