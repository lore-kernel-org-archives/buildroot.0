From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 21 May 2016 21:28:41 +0300
Subject: [Buildroot] [PATCH] libgtk3: bump to version 320.5
In-Reply-To: <1463766005-9156-1-git-send-email-gustavo@zacarias.com.ar>
References: <1463766005-9156-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160521182841.GF2178@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Fri, May 20, 2016 at 02:40:05PM -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Subject should change to 3.20.5.

baruch

> ---
>  package/libgtk3/libgtk3.hash | 4 ++--
>  package/libgtk3/libgtk3.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
> index 78bfc86..47f5977 100644
> --- a/package/libgtk3/libgtk3.hash
> +++ b/package/libgtk3/libgtk3.hash
> @@ -1,2 +1,2 @@
> -# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.20/gtk+-3.20.4.sha256sum
> -sha256	e7e3aaf54a54dd1c1ca0588939254abe31329e0bcd280a12290d5306b41ea03f	gtk+-3.20.4.tar.xz
> +# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.20/gtk+-3.20.5.sha256sum
> +sha256	9790b0267384904ad8a08e7f16e5f9ff1c4037de57788d48d1eaf528355b1564	gtk+-3.20.5.tar.xz
> diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
> index 0ba7928..469ff13 100644
> --- a/package/libgtk3/libgtk3.mk
> +++ b/package/libgtk3/libgtk3.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  LIBGTK3_VERSION_MAJOR = 3.20
> -LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).4
> +LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).5
>  LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
>  LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
>  LIBGTK3_LICENSE = LGPLv2+

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
