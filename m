From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 25 Jun 2014 22:14:54 +0200
Subject: [Buildroot] [PATCH 22/54] ndisc6: add license information
In-Reply-To: <1403636160-11807-22-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
 <1403636160-11807-22-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140625201454.GJ3489@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-06-24 15:55 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

To be noted, the files compat/fdatasync.c and compat/ppoll.c are GPLV2+,
but as a whole, the project is indeed GPLv2 or GPLv3.

Regards,
Yann E. MORIN.

> ---
>  package/ndisc6/ndisc6.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/ndisc6/ndisc6.mk b/package/ndisc6/ndisc6.mk
> index 719f85d..257289d 100644
> --- a/package/ndisc6/ndisc6.mk
> +++ b/package/ndisc6/ndisc6.mk
> @@ -9,6 +9,8 @@ NDISC6_SOURCE = ndisc6-$(NDISC6_VERSION).tar.bz2
>  NDISC6_SITE = http://www.remlab.net/files/ndisc6/
>  NDISC6_CONF_ENV = CC="$(TARGET_CC) -std=gnu99"
>  NDISC6_CONF_OPT = --localstatedir=/var --disable-rpath --disable-suid-install
> +NDISC6_LICENSE = GPLv2 or GPLv3
> +NDISC6_LICENSE_FILES = COPYING
>  
>  ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
>  NDISC6_DEPENDENCIES += gettext
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
