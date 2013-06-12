From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Jun 2013 07:52:22 +0200
Subject: [Buildroot] [PATCH v10 07/13] gstreamer: update Config.in with
 gstreamer1 info.
In-Reply-To: <1370647138-26623-8-git-send-email-spenser@gillilanding.com>
References: <1370647138-26623-1-git-send-email-spenser@gillilanding.com>
 <1370647138-26623-8-git-send-email-spenser@gillilanding.com>
Message-ID: <51B80C96.5020702@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/06/13 01:18, Spenser Gilliland wrote:
> Update the gstreamer1 Config.in with note about Gstreamer 0.1X being
> incompatible with gstreamer 1.X.
> ---
>   package/multimedia/gstreamer/Config.in |    3 ++-
>   1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/package/multimedia/gstreamer/Config.in b/package/multimedia/gstreamer/Config.in
> index 4b4d80f..55fd016 100644
> --- a/package/multimedia/gstreamer/Config.in
> +++ b/package/multimedia/gstreamer/Config.in
> @@ -4,7 +4,8 @@ config BR2_PACKAGE_GSTREAMER
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
>   	select BR2_PACKAGE_LIBGLIB2
>   	help
> -	  GStreamer is an open source multimedia framework.
> +	  GStreamer is an open source multimedia framework. This 0.1x version of

  0.10. We'll never have a 0.11.


  Regards,
  Arnout

> +	  Gstreamer is incompatible with Gstreamer 1.X.
>
>   	  http://gstreamer.freedesktop.org/
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
