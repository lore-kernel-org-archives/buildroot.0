From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 24 Jun 2014 23:33:44 +0200
Subject: [Buildroot] [PATCH 01/54] gvfs: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140624213344.GB31767@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-06-24 15:55 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

I looked at random files: most have a license header refering to
LGPLv2+, while some do not have this header. The COPYING file is
here.

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/gvfs/gvfs.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
> index dbf234e..58707aa 100644
> --- a/package/gvfs/gvfs.mk
> +++ b/package/gvfs/gvfs.mk
> @@ -10,6 +10,8 @@ GVFS_SOURCE = gvfs-$(GVFS_VERSION).tar.xz
>  GVFS_SITE = http://ftp.gnome.org/pub/GNOME/sources/gvfs/$(GVFS_VERSION_MAJOR)
>  GVFS_INSTALL_STAGING = YES
>  GVFS_DEPENDENCIES = host-pkgconf host-libglib2 libglib2 dbus shared-mime-info
> +GVFS_LICENSE = LGPLv2+
> +GVFS_LICENSE = COPYING
>  
>  # Export ac_cv_path_LIBGCRYPT_CONFIG unconditionally to prevent
>  # build system from searching the host paths.
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
