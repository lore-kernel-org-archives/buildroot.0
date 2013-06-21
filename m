From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 21 Jun 2013 16:02:30 +0200
Subject: [Buildroot] [PATCH v12 02/11] gstreamer: update for gstreamer1
In-Reply-To: <1371766066-676-3-git-send-email-spenser@gillilanding.com>
 (Spenser Gilliland's message of "Thu, 20 Jun 2013 17:07:37 -0500")
References: <1371766066-676-1-git-send-email-spenser@gillilanding.com>
 <1371766066-676-3-git-send-email-spenser@gillilanding.com>
Message-ID: <87sj0bmuix.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Spenser" == Spenser Gilliland <spenser@gillilanding.com> writes:

 Spenser> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
 Spenser> ---
 Spenser>  package/multimedia/gstreamer/Config.in |    3 ++-
 Spenser>  1 file changed, 2 insertions(+), 1 deletion(-)

 Spenser> diff --git a/package/multimedia/gstreamer/Config.in b/package/multimedia/gstreamer/Config.in
 Spenser> index 4b4d80f..44c96e4 100644
 Spenser> --- a/package/multimedia/gstreamer/Config.in
 Spenser> +++ b/package/multimedia/gstreamer/Config.in
 Spenser> @@ -4,7 +4,8 @@ config BR2_PACKAGE_GSTREAMER
 Spenser>  	depends on BR2_TOOLCHAIN_HAS_THREADS
 Spenser>  	select BR2_PACKAGE_LIBGLIB2
 Spenser>  	help
 Spenser> -	  GStreamer is an open source multimedia framework.
 Spenser> +	  GStreamer is an open source multimedia framework. This 0.10.x version of
 Spenser> +	  Gstreamer is incompatible with Gstreamer 1.X. 

I've already merged v10 of this.

-- 
Bye, Peter Korsgaard
