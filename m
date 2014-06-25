From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 25 Jun 2014 21:52:39 +0200
Subject: [Buildroot] [PATCH 18/54] libsysfs: add license information
In-Reply-To: <1403636160-11807-18-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
 <1403636160-11807-18-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140625195239.GG3489@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-06-24 15:55 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libsysfs/libsysfs.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/libsysfs/libsysfs.mk b/package/libsysfs/libsysfs.mk
> index 6bd3c5c..fb0310f 100644
> --- a/package/libsysfs/libsysfs.mk
> +++ b/package/libsysfs/libsysfs.mk
> @@ -8,5 +8,7 @@ LIBSYSFS_VERSION = 2.1.0
>  LIBSYSFS_SITE = http://downloads.sourceforge.net/project/linux-diag/sysfsutils/$(LIBSYSFS_VERSION)
>  LIBSYSFS_SOURCE = sysfsutils-$(LIBSYSFS_VERSION).tar.gz
>  LIBSYSFS_INSTALL_STAGING = YES
> +LIBSYSFS_LICENSE = GPLv2 (utilities), LGPLv2.1+ (library)
> +LIBSYSFS_LICENSE_FILES = cmd/GPL lib/LGPL
>  
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
