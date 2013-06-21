From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 21 Jun 2013 16:05:15 +0200
Subject: [Buildroot] [PATCH v12 06/11] gst1-plugins-ugly: add gstreamer1
	ugly plugins
In-Reply-To: <1371766066-676-7-git-send-email-spenser@gillilanding.com>
 (Spenser Gilliland's message of "Thu, 20 Jun 2013 17:07:41 -0500")
References: <1371766066-676-1-git-send-email-spenser@gillilanding.com>
 <1371766066-676-7-git-send-email-spenser@gillilanding.com>
Message-ID: <87bo6zmuec.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Spenser" == Spenser Gilliland <spenser@gillilanding.com> writes:

 Spenser> Adds gstreamer 1.X ugly plugins
 Spenser> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
 Spenser> ---
 Spenser>  package/multimedia/Config.in                       |    3 +-
 Spenser>  package/multimedia/gst1-plugins-ugly/Config.in     |   69 +++++++++++++
 Spenser>  .../gst1-plugins-ugly/gst1-plugins-ugly.mk         |  104 ++++++++++++++++++++
 Spenser>  3 files changed, 175 insertions(+), 1 deletion(-)
 Spenser>  create mode 100644 package/multimedia/gst1-plugins-ugly/Config.in
 Spenser>  create mode 100644 package/multimedia/gst1-plugins-ugly/gst1-plugins-ugly.mk

 Spenser> diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
 Spenser> index 318dd74..30a20cb 100644
 Spenser> --- a/package/multimedia/Config.in
 Spenser> +++ b/package/multimedia/Config.in
 Spenser> @@ -18,7 +18,8 @@ source "package/multimedia/gst1-plugins-good/Config.in"
 Spenser>  source "package/multimedia/gst-plugins-bad/Config.in"
 Spenser>  source "package/multimedia/gst1-plugins-bad/Config.in"
 Spenser>  source "package/multimedia/gst-plugins-ugly/Config.in"
 Spenser> -source "package/multimedia/gst-plugin-x170/Config.in"
 Spenser> +source "package/multimedia/gst1-plugins-ugly/Config.in"
 Spenser> +source "package/multimedia/gst-plugin-x170/Config.in

Committed with this fixed, thanks.

-- 
Bye, Peter Korsgaard
