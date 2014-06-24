From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 25 Jun 2014 00:21:17 +0200
Subject: [Buildroot] [PATCH 13/54] libical: add license information
In-Reply-To: <1403636160-11807-13-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
 <1403636160-11807-13-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140624222117.GP31767@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2014-06-24 15:55 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

LICENSE file, random files, yadda yadda... 

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

But see below...

> ---
>  package/libical/libical.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/libical/libical.mk b/package/libical/libical.mk
> index cdee006..4025627 100644
> --- a/package/libical/libical.mk
> +++ b/package/libical/libical.mk
> @@ -7,5 +7,7 @@
>  LIBICAL_VERSION = 0.48
>  LIBICAL_SITE = http://downloads.sourceforge.net/project/freeassociation/libical/libical-$(LIBICAL_VERSION)
>  LIBICAL_INSTALL_STAGING = YES
> +LIBICAL_LICENSE = MPLv1.0 or LGPLv2.1
> +LIBICAL_LICENSE_FILES = LICENSE

There's also a COPYING file, which content appear to be the exact same
as the LICENSE file. So, OK to get only one of them. I'd have prefered
COPYING, but that's equally equal. ;-)

Regards,
Yann E. MORIN.

>  $(eval $(autotools-package))
> -- 
> 1.8.5.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
