From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Apr 2014 16:47:09 +0200
Subject: [Buildroot] [PATCH] mpd: bump to version 0.18.10
In-Reply-To: <1398166043-5569-1-git-send-email-gustavo@zacarias.com.ar>
References: <1398166043-5569-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140425164709.7c1ef6e9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 22 Apr 2014 08:27:23 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/mpd/mpd.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
> index 7e4ebac..ad393c7 100644
> --- a/package/mpd/mpd.mk
> +++ b/package/mpd/mpd.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  MPD_VERSION_MAJOR = 0.18
> -MPD_VERSION = $(MPD_VERSION_MAJOR).9
> +MPD_VERSION = $(MPD_VERSION_MAJOR).10
>  MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
>  MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
>  MPD_DEPENDENCIES = host-pkgconf libglib2

This is causing some build failures (though not sure they are only
related to this bump) :

  http://autobuild.buildroot.org/results/7be/7be0e42278657bd693dca9238ff3d7b66d601f32/build-end.log

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
