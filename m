From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 20 Jun 2013 14:49:19 +0200
Subject: [Buildroot] [PATCH v11 01/11] gstreamer1: Add gstreamer version
	1.1.1 package
In-Reply-To: <1371701651-7739-2-git-send-email-spenser@gillilanding.com>
 (Spenser Gilliland's message of "Wed, 19 Jun 2013 23:14:00 -0500")
References: <1371701651-7739-1-git-send-email-spenser@gillilanding.com>
 <1371701651-7739-2-git-send-email-spenser@gillilanding.com>
Message-ID: <87obb1ne0g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Spenser" == Spenser Gilliland <spenser@gillilanding.com> writes:

 Spenser> This patch adds the gstreamer version 1.x series to buildroot.
 Spenser> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
 Spenser> ---
 Spenser>  package/multimedia/Config.in                |    1 +
 Spenser>  package/multimedia/gstreamer1/Config.in     |   55 +++++++++++++++++++++++++++
 Spenser>  package/multimedia/gstreamer1/gstreamer1.mk |   40 +++++++++++++++++++
 Spenser>  3 files changed, 96 insertions(+)

 Spenser> +++ b/package/multimedia/gstreamer1/gstreamer1.mk
 Spenser> @@ -0,0 +1,40 @@
 Spenser> +#############################################################
 Spenser> +#
 Spenser> +# gstreamer1
 Spenser> +#
 Spenser> +#############################################################
 Spenser> +
 Spenser> +GSTREAMER1_VERSION = 1.1.1

Maybe I missed the discussion about this earlier, but why are you
packaging the 1.1.x development version instead of the stable 1.0.x? I
would imagine that most people (if they are not actively working on
gstreamer atleast) would prefer the stable version?

-- 
Bye, Peter Korsgaard
