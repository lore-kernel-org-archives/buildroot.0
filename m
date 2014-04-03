From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 21:48:02 +0200
Subject: [Buildroot] [PATCH 1/1] eudev : bump version to 1.5.3
In-Reply-To: <1396132833-20016-1-git-send-email-sagaert.johan@skynet.be>
References: <1396132833-20016-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <20140403214802.320a9e60@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric,

Can you review/test/ack the below patch, since you're the most active
person on eudev?

Thanks,

Thomas

On Sat, 29 Mar 2014 23:40:33 +0100, Sagaert Johan wrote:
> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
> ---
>  package/eudev/eudev.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
> index a2fe528..8e5e83d 100644
> --- a/package/eudev/eudev.mk
> +++ b/package/eudev/eudev.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -EUDEV_VERSION = 1.5.2
> +EUDEV_VERSION = 1.5.3
>  EUDEV_SITE = $(call github,gentoo,eudev,$(EUDEV_VERSION))
>  EUDEV_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)
>  EUDEV_LICENSE_FILES = COPYING



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
