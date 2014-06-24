From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 25 Jun 2014 00:05:48 +0200
Subject: [Buildroot] [PATCH 11/54] libgtk2: add license information
In-Reply-To: <1403636160-11807-11-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
 <1403636160-11807-11-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140624220548.GM31767@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-06-24 15:55 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Ditto, COPYING OK; a few random files OK.

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libgtk2/libgtk2.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
> index cadca63..2ba9469 100644
> --- a/package/libgtk2/libgtk2.mk
> +++ b/package/libgtk2/libgtk2.mk
> @@ -11,6 +11,8 @@ LIBGTK2_SOURCE = gtk+-$(LIBGTK2_VERSION).tar.xz
>  LIBGTK2_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK2_VERSION_MAJOR)
>  LIBGTK2_INSTALL_STAGING = YES
>  LIBGTK2_INSTALL_TARGET = YES
> +LIBGTK2_LICENSE = LGPLv2+
> +LIBGTK2_LICENSE_FILES = COPYING
>  
>  LIBGTK2_AUTORECONF = YES
>  
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
