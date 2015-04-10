From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 10 Apr 2015 18:59:55 +0200
Subject: [Buildroot] [PATCH 1/2] package/qt5/qt5xmlpatterns: Fix license
In-Reply-To: <1428684801-24491-1-git-send-email-bernd.kuhls@t-online.de>
References: <1428684801-24491-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150410165955.GA4313@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-04-10 18:53 +0200, Bernd Kuhls spake thusly:
> Fixes
> http://autobuild.buildroot.net/results/853/85335cddd123cae5a5b99d715c179c26ed9d6009/
> http://autobuild.buildroot.net/results/097/0970e3d663da687f9bcdf0136584eaa5629f4216/
> http://autobuild.buildroot.net/results/c62/c62eef5e5b8add138cdab34e64103d974d0a510b/
> http://autobuild.buildroot.net/results/8b2/8b22985cc4a3ed3ced5900931dc6ec3b4c2f36c6/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Thomas has already sent a patch to fix those two legal-info issues:
    https://patchwork.ozlabs.org/patch/460020/

Since your two patches and his own are exactly the same, but his patch
has more context in the commit log, I'll mark your patches as Rejected
in Patchwork.

Nevertheless, thank you! :-)

Regards,
Yann E. MORIN.

> ---
>  package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
> index b69cac7..136da9f 100644
> --- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
> +++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
> @@ -11,8 +11,8 @@ QT5XMLPATTERNS_DEPENDENCIES = qt5base
>  QT5XMLPATTERNS_INSTALL_STAGING = YES
>  
>  ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
> -QT5XMLPATTERNS_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
> -QT5XMLPATTERNS_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2
> +QT5XMLPATTERNS_LICENSE = LGPLv2.1 with exception or LGPLv3
> +QT5XMLPATTERNS_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3
>  else
>  QT5XMLPATTERNS_LICENSE = Commercial license
>  QT5XMLPATTERNS_REDISTRIBUTE = NO
> -- 
> 1.7.10.4
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
