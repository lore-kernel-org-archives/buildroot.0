From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Jan 2016 02:05:04 +0100
Subject: [Buildroot] [PATCH 1/2] package/mjpg-streamer: bump version
In-Reply-To: <1453561408-10088-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453561408-10088-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <56A42340.5040404@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23-01-16 16:03, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mjpg-streamer/mjpg-streamer.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/mjpg-streamer/mjpg-streamer.mk b/package/mjpg-streamer/mjpg-streamer.mk
> index e10e9a8..e54c600 100644
> --- a/package/mjpg-streamer/mjpg-streamer.mk
> +++ b/package/mjpg-streamer/mjpg-streamer.mk
> @@ -8,7 +8,7 @@
>  # http://sourceforge.net/p/mjpg-streamer/code/commit_browser
>  # oliv3r forked the repo to add support for 3.16 and 3.17 kernels:
>  # http://sourceforge.net/p/mjpg-streamer/patches/14/
> -MJPG_STREAMER_VERSION = 730b5bcdc378b6a201131c6c2620eedbe0f6eb30
> +MJPG_STREAMER_VERSION = bbf32fddfd02a9e072e89e83a5b33e6ca0a7bd4b
>  MJPG_STREAMER_SITE = $(call github,oliv3r,mjpg-streamer,$(MJPG_STREAMER_VERSION))
>  MJPG_STREAMER_LICENSE = GPLv2+
>  MJPG_STREAMER_LICENSE_FILES = LICENSE
> 

 Can you also add a hash file?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
