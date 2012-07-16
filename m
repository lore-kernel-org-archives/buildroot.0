From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Jul 2012 15:03:18 +0200
Subject: [Buildroot] [PATCH 3/4] Factorise the u-boot images code
In-Reply-To: <1341309676-18681-4-git-send-email-maxime.ripard@free-electrons.com>
References: <1341309676-18681-1-git-send-email-maxime.ripard@free-electrons.com>
 <1341309676-18681-4-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <20120716150318.41804739@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue,  3 Jul 2012 12:01:15 +0200,
Maxime Ripard <maxime.ripard@free-electrons.com> a ?crit :

> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  linux/Config.in |    4 ++++
>  linux/linux.mk  |    5 ++++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 46b9756..c5488e8 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -176,12 +176,16 @@ endif
>  # Binary format
>  #
>  
> +config BR2_LINUX_KERNEL_UBOOT_IMAGE
> +       bool

Maybe this should rather be BR2_LINUX_KERNEL_NEEDS_MKIMAGE ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
