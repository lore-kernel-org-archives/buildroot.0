From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 31 May 2020 10:04:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/xen: security bump to version
 4.13.1
In-Reply-To: <20200530122532.3477185-1-fontaine.fabrice@gmail.com>
References: <20200530122532.3477185-1-fontaine.fabrice@gmail.com>
Message-ID: <20200531080458.GX8737@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-05-30 14:25 +0200, Fabrice Fontaine spake thusly:
> - Fix CVE-2020-11739: An issue was discovered in Xen through 4.13.x,
[--SNIP--]
> - Fix CVE-2020-11740: An issue was discovered in xenoprof in Xen through
[--SNIP--]
> - Fix CVE-2020-11741: An issue was discovered in xenoprof in Xen through
[--SNIP--]
> - Fix CVE-2020-11742: An issue was discovered in Xen through 4.13.x,
[--SNIP--]
> - Fix CVE-2020-11743: An issue was discovered in Xen through 4.13.x,
[--SNIP--]
> https://xenproject.org/downloads/xen-project-archives/xen-project-4-13-series/xen-project-4-13-1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thank.

Regards,
Yann E. MORIN.

> ---
>  package/xen/xen.hash | 2 +-
>  package/xen/xen.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/xen/xen.hash b/package/xen/xen.hash
> index 4224924652..ab5f9d9083 100644
> --- a/package/xen/xen.hash
> +++ b/package/xen/xen.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  c69ae21b2ddeaf25532a81a448fcc6a218bc56f93c8907b2d416b2d4339c0afe  xen-4.13.0.tar.gz
> +sha256  b97ce363e55b12c992063f4466c43cba0a6386ceb7a747b4dc670311f337ef01  xen-4.13.1.tar.gz
>  sha256  36b91794c6d4a678137c70c41e384c03b552c7efba82c0d73e6be842e41ab3d3  COPYING
> diff --git a/package/xen/xen.mk b/package/xen/xen.mk
> index fa49f5996b..15742b5127 100644
> --- a/package/xen/xen.mk
> +++ b/package/xen/xen.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XEN_VERSION = 4.13.0
> +XEN_VERSION = 4.13.1
>  XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
>  XEN_LICENSE = GPL-2.0
>  XEN_LICENSE_FILES = COPYING
> -- 
> 2.26.2
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
