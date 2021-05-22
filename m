From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 May 2021 22:03:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/picocom: add
 PICOCOM_CPE_ID_VENDOR
In-Reply-To: <20210522175351.279349-1-fontaine.fabrice@gmail.com>
References: <20210522175351.279349-1-fontaine.fabrice@gmail.com>
Message-ID: <20210522200348.GE3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-22 19:53 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:picocom_project:picocom is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apicocom_project%3Apicocom
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/picocom/picocom.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/picocom/picocom.mk b/package/picocom/picocom.mk
> index d27c734376..2d585bb2f5 100644
> --- a/package/picocom/picocom.mk
> +++ b/package/picocom/picocom.mk
> @@ -8,6 +8,7 @@ PICOCOM_VERSION = 3.1
>  PICOCOM_SITE = $(call github,npat-efault,picocom,$(PICOCOM_VERSION))
>  PICOCOM_LICENSE = GPL-2.0+
>  PICOCOM_LICENSE_FILES = LICENSE.txt
> +PICOCOM_CPE_ID_VENDOR = picocom_project
>  
>  define PICOCOM_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
