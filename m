From: =?UTF-8?Q?J=C3=A9r=C3=B4me_Pouiller?= <jezz@sysmic.org>
Date: Thu, 08 Aug 2013 09:03:03 +0200
Subject: [Buildroot] [PATCH 1 of 2] strongswan: needs host-pkgconf
In-Reply-To: <a94c373a618404a0d79d.1375896856@BEANTN0L019720>
References: <patchbomb.1375896855@BEANTN0L019720>
 <a94c373a618404a0d79d.1375896856@BEANTN0L019720>
Message-ID: <4aec5b2650ccee1cdbc7da0d13553ed7@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2013-08-07 19:34, Thomas De Schampheleire wrote:
> Signed-off-by: Thomas De Schampheleire 
> <thomas.de.schampheleire@gmail.com>
>
> diff --git a/package/strongswan/strongswan.mk 
> b/package/strongswan/strongswan.mk
> --- a/package/strongswan/strongswan.mk
> +++ b/package/strongswan/strongswan.mk
> @@ -9,6 +9,7 @@ STRONGSWAN_SOURCE = strongswan-$(STRONGS
>  STRONGSWAN_SITE = http://download.strongswan.org
>  STRONGSWAN_LICENSE = GPLv2+
>  STRONGSWAN_LICENSE_FILES = COPYING LICENSE
> +STRONGSWAN_DEPENDENCIES = host-pkgconf
>  STRONGSWAN_CONF_OPT +=                                               
>              \
>        --enable-pkcs11=yes                                            
>              \
>        --enable-kernel-netlink=$(if $(BR2_INET_IPV6),yes,no)          
>              \

Tested-by: J?r?me Pouiller <jezz@sysmic.org>

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
