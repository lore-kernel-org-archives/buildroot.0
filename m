From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Mar 2021 11:27:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/gvfs: add GVFS_CPE_ID_VENDOR
In-Reply-To: <20210321093000.533877-1-fontaine.fabrice@gmail.com>
References: <20210321093000.533877-1-fontaine.fabrice@gmail.com>
Message-ID: <20210321102734.GC3443324@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-03-21 10:30 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:gnome:gvfs is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnome%3Agvfs
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gvfs/gvfs.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
> index c5104e8dbf..fc77e8e1aa 100644
> --- a/package/gvfs/gvfs.mk
> +++ b/package/gvfs/gvfs.mk
> @@ -19,6 +19,7 @@ GVFS_DEPENDENCIES = \
>  	$(TARGET_NLS_DEPENDENCIES)
>  GVFS_LICENSE = LGPL-2.0+
>  GVFS_LICENSE_FILES = COPYING
> +GVFS_CPE_ID_VENDOR = gnome
>  
>  GVFS_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
>  
> -- 
> 2.30.1
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
