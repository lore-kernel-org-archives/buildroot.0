From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 22 Jan 2013 21:37:48 +0100
Subject: [Buildroot] [PATCH v4 1/2] Yavta: new package
In-Reply-To: <1358849373-20243-1-git-send-email-kpa_info@yahoo.fr> (Patrick
 Gerber's message of "Tue, 22 Jan 2013 11:09:32 +0100")
References: <1358849373-20243-1-git-send-email-kpa_info@yahoo.fr>
Message-ID: <878v7l3qeb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Patrick" == Patrick Gerber <kpa_info@yahoo.fr> writes:

 Patrick> Signed-off-by: Patrick Gerber <kpa_info@yahoo.fr>
 Patrick> ---
 Patrick>  package/multimedia/Config.in       |    1 +
 Patrick>  package/multimedia/yavta/Config.in |    6 ++++++
 Patrick>  package/multimedia/yavta/yavta.mk  |   20 ++++++++++++++++++++
 Patrick>  3 files changed, 27 insertions(+)
 Patrick>  create mode 100644 package/multimedia/yavta/Config.in
 Patrick>  create mode 100644 package/multimedia/yavta/yavta.mk

 Patrick> diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
 Patrick> index e50eda9..5b2d1ad 100644
 Patrick> --- a/package/multimedia/Config.in
 Patrick> +++ b/package/multimedia/Config.in
 Patrick> @@ -25,4 +25,5 @@ source "package/multimedia/pulseaudio/Config.in"
 Patrick>  source "package/multimedia/tidsp-binaries/Config.in"
 Patrick>  source "package/multimedia/vorbis-tools/Config.in"
 Patrick>  source "package/multimedia/wavpack/Config.in"
 Patrick> +source "package/multimedia/yavta/Config.in"

Long term I would like to get rid of the multimedia subdir, so I took
the liberty to move it up to package.

 Patrick> +++ b/package/multimedia/yavta/yavta.mk
 Patrick> @@ -0,0 +1,20 @@
 Patrick> +#############################################################
 Patrick> +#
 Patrick> +# yavta
 Patrick> +#
 Patrick> +#############################################################
 Patrick> +
 Patrick> +YAVTA_VERSION = 82ff2efdb9787737b9f21b6f4759f077c827b238
 Patrick> +YAVTA_SITE = git://git.ideasonboard.org/yavta.git
 Patrick> +YAVTA_LICENSE = GPLv2

License is GPLv2+ according to the header in yavta.c, so I've changed
that.

Committed with these changes, thanks.

-- 
Bye, Peter Korsgaard
