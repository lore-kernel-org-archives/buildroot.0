From: Utham Reddy <reddy.utham@gmail.com>
Date: Wed, 9 Oct 2013 14:18:55 -0700
Subject: [Buildroot] unsubscribe
Message-ID: <CAGNqhkvwVj26SF8g18G_f7qWN0EuAjbX+gpSTmTh8ASNheOJrQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

unsubscribe


On Thu, Sep 19, 2013 at 10:43 PM, Fatih A??c? <fatih.asici@gmail.com> wrote:

> These packages do not have configure scripts.
>
> Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
> ---
>  package/qt5/qt5declarative/qt5declarative.mk           |    1 -
>  package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk |    1 -
>  package/qt5/qt5imageformats/qt5imageformats.mk         |    1 -
>  package/qt5/qt5jsbackend/qt5jsbackend.mk               |    1 -
>  package/qt5/qt5multimedia/qt5multimedia.mk             |    1 -
>  package/qt5/qt5quick1/qt5quick1.mk                     |    1 -
>  package/qt5/qt5script/qt5script.mk                     |    1 -
>  package/qt5/qt5svg/qt5svg.mk                           |    1 -
>  package/qt5/qt5webkit/qt5webkit.mk                     |    1 -
>  package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk           |    1 -
>  10 files changed, 10 deletions(-)
>
> diff --git a/package/qt5/qt5declarative/qt5declarative.mkb/package/qt5/qt5declarative/
> qt5declarative.mk
> index 943f33d..11b9287 100644
> --- a/package/qt5/qt5declarative/qt5declarative.mk
> +++ b/package/qt5/qt5declarative/qt5declarative.mk
> @@ -11,7 +11,6 @@ QT5DECLARATIVE_DEPENDENCIES = qt5base qt5xmlpatterns
> qt5jsbackend
>  QT5DECLARATIVE_INSTALL_STAGING = YES
>
>  ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
> -QT5DECLARATIVE_CONFIGURE_OPTS += -opensource -confirm-license
>  QT5DECLARATIVE_LICENSE = LGPLv2.1 or GPLv3.0
>  QT5DECLARATIVE_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
>  else
> diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mkb/package/qt5/qt5graphicaleffects/
> qt5graphicaleffects.mk
> index fc9a2ec..1e492c9 100644
> --- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
> +++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
> @@ -11,7 +11,6 @@ QT5GRAPHICALEFFECTS_DEPENDENCIES = qt5base qt5declarative
>  QT5GRAPHICALEFFECTS_INSTALL_STAGING = YES
>
>  ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
> -QT5GRAPHICALEFFECTS_CONFIGURE_OPTS += -opensource -confirm-license
>  QT5GRAPHICALEFFECTS_LICENSE = LGPLv2.1 or GPLv3.0
>  # Here we would like to get license files from qt5base, but qt5base
>  # may not be extracted at the time we get the legal-info for
> diff --git a/package/qt5/qt5imageformats/qt5imageformats.mkb/package/qt5/qt5imageformats/
> qt5imageformats.mk
> index 10d744b..52192c6 100644
> --- a/package/qt5/qt5imageformats/qt5imageformats.mk
> +++ b/package/qt5/qt5imageformats/qt5imageformats.mk
> @@ -11,7 +11,6 @@ QT5IMAGEFORMATS_DEPENDENCIES = qt5base
>  QT5IMAGEFORMATS_INSTALL_STAGING = YES
>
>  ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
> -QT5IMAGEFORMATS_CONFIGURE_OPTS += -opensource -confirm-license
>  QT5IMAGEFORMATS_LICENSE = LGPLv2.1 or GPLv3.0
>  QT5IMAGEFORMATS_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL
> LGPL_EXCEPTION.txt
>  else
> diff --git a/package/qt5/qt5jsbackend/qt5jsbackend.mkb/package/qt5/qt5jsbackend/
> qt5jsbackend.mk
> index d065f0b..9eccd23 100644
> --- a/package/qt5/qt5jsbackend/qt5jsbackend.mk
> +++ b/package/qt5/qt5jsbackend/qt5jsbackend.mk
> @@ -11,7 +11,6 @@ QT5JSBACKEND_DEPENDENCIES = qt5base
>  QT5JSBACKEND_INSTALL_STAGING = YES
>
>  ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
> -QT5JSBACKEND_CONFIGURE_OPTS += -opensource -confirm-license
>  QT5JSBACKEND_LICENSE = LGPLv2.1 or GPLv3.0
>  QT5JSBACKEND_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
>  else
> diff --git a/package/qt5/qt5multimedia/qt5multimedia.mkb/package/qt5/qt5multimedia/
> qt5multimedia.mk
> index 8f62274..1a3ca6b 100644
> --- a/package/qt5/qt5multimedia/qt5multimedia.mk
> +++ b/package/qt5/qt5multimedia/qt5multimedia.mk
> @@ -11,7 +11,6 @@ QT5MULTIMEDIA_DEPENDENCIES = qt5base qt5declarative
>  QT5MULTIMEDIA_INSTALL_STAGING = YES
>
>  ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
> -QT5MULTIMEDIA_CONFIGURE_OPTS += -opensource -confirm-license
>  QT5MULTIMEDIA_LICENSE = LGPLv2.1 or GPLv3.0
>  # Here we would like to get license files from qt5base, but qt5base
>  # may not be extracted at the time we get the legal-info for
> diff --git a/package/qt5/qt5quick1/qt5quick1.mk b/package/qt5/qt5quick1/
> qt5quick1.mk
> index d1b0b36..f9bb3e8 100644
> --- a/package/qt5/qt5quick1/qt5quick1.mk
> +++ b/package/qt5/qt5quick1/qt5quick1.mk
> @@ -12,7 +12,6 @@ QT5QUICK1_DEPENDENCIES = qt5base qt5xmlpatterns
> qt5script qt5declarative qt5jsba
>  QT5QUICK1_INSTALL_STAGING = YES
>
>  ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
> -QT5QUICK1_CONFIGURE_OPTS += -opensource -confirm-license
>  QT5QUICK1_LICENSE = LGPLv2.1 or GPLv3.0
>  QT5QUICK1_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
>  else
> diff --git a/package/qt5/qt5script/qt5script.mk b/package/qt5/qt5script/
> qt5script.mk
> index e436474..e62e0ac 100644
> --- a/package/qt5/qt5script/qt5script.mk
> +++ b/package/qt5/qt5script/qt5script.mk
> @@ -11,7 +11,6 @@ QT5SCRIPT_DEPENDENCIES = qt5base
>  QT5SCRIPT_INSTALL_STAGING = YES
>
>  ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
> -QT5SCRIPT_CONFIGURE_OPTS += -opensource -confirm-license
>  QT5SCRIPT_LICENSE = LGPLv2.1 or GPLv3.0
>  QT5SCRIPT_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
>  else
> diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
> index 8a31ac8..2ff7fc8 100644
> --- a/package/qt5/qt5svg/qt5svg.mk
> +++ b/package/qt5/qt5svg/qt5svg.mk
> @@ -11,7 +11,6 @@ QT5SVG_DEPENDENCIES = qt5base
>  QT5SVG_INSTALL_STAGING = YES
>
>  ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
> -QT5SVG_CONFIGURE_OPTS += -opensource -confirm-license
>  QT5SVG_LICENSE = LGPLv2.1 or GPLv3.0
>  # Here we would like to get license files from qt5base, but qt5base
>  # may not be extracted at the time we get the legal-info for qt5svg.
> diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/
> qt5webkit.mk
> index 320a2ea..87b15a9 100644
> --- a/package/qt5/qt5webkit/qt5webkit.mk
> +++ b/package/qt5/qt5webkit/qt5webkit.mk
> @@ -11,7 +11,6 @@ QT5WEBKIT_DEPENDENCIES = qt5base sqlite host-ruby
> host-gperf
>  QT5WEBKIT_INSTALL_STAGING = YES
>
>  ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
> -QT5WEBKIT_CONFIGURE_OPTS += -opensource -confirm-license
>  QT5WEBKIT_LICENSE = LGPLv2.1 or GPLv3.0
>  # Here we would like to get license files from qt5base, but qt5base
>  # may not be extracted at the time we get the legal-info for
> diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mkb/package/qt5/qt5xmlpatterns/
> qt5xmlpatterns.mk
> index 322fd70..6f4fdc8 100644
> --- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
> +++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
> @@ -11,7 +11,6 @@ QT5XMLPATTERNS_DEPENDENCIES = qt5base
>  QT5XMLPATTERNS_INSTALL_STAGING = YES
>
>  ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
> -QT5XMLPATTERNS_CONFIGURE_OPTS += -opensource -confirm-license
>  QT5XMLPATTERNS_LICENSE = LGPLv2.1 or GPLv3.0
>  QT5XMLPATTERNS_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
>  else
> --
> 1.7.10.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131009/1b4e60cb/attachment-0001.html>
