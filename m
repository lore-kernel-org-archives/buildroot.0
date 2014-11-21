From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 21 Nov 2014 15:56:05 +0000
Subject: [Buildroot] [PATCH] Bumped version number
In-Reply-To: <1416579560-6740-1-git-send-email-jaap@jcz.nl>
References: <1416579560-6740-1-git-send-email-jaap@jcz.nl>
Message-ID: <546F6095.2020207@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jaap Crezee,

On 11/21/2014 02:19 PM, Jaap Crezee wrote:
> ---
>  package/bluez5_utils/bluez5_utils.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
> index f34513c..21f792c 100644
> --- a/package/bluez5_utils/bluez5_utils.mk
> +++ b/package/bluez5_utils/bluez5_utils.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BLUEZ5_UTILS_VERSION = 5.21
> +BLUEZ5_UTILS_VERSION = 5.25
>  BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
>  BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
>  BLUEZ5_UTILS_INSTALL_STAGING = YES
> 

I have tested your patch and it works fine. However, could you please
send a v2 version with a better subject? Something like "bluez5-utils:
bump version to 5.25" would be much better.

Also, could you add a hash file at the same time? If you don't know what
I'm talking about, please read this:
http://buildroot.org/downloads/manual/manual.html#adding-packages-hash

Thanks.
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
