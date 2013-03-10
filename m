From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Mar 2013 23:13:23 +0100
Subject: [Buildroot] [PATCH] flot: add fillbetween plugin.
In-Reply-To: <1360769145-1610-1-git-send-email-rebillout@syscom.ch> ("Arnaud
 =?utf-8?Q?R=C3=A9billout=22's?= message of "Wed, 13 Feb 2013 16:25:45
 +0100")
References: <1360769145-1610-1-git-send-email-rebillout@syscom.ch>
Message-ID: <87sj42vr7g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnaud" == Arnaud R?billout <rebillout@syscom.ch> writes:

 Arnaud> Flot plugin for computing bottoms for filled line and bar charts.
 Arnaud> Signed-off-by: Arnaud R?billout <rebillout@syscom.ch>
 Arnaud> ---
 Arnaud>  package/flot/Config.in |    5 +++++
 Arnaud>  package/flot/flot.mk   |    1 +
 Arnaud>  2 files changed, 6 insertions(+)

 Arnaud> diff --git a/package/flot/Config.in b/package/flot/Config.in
 Arnaud> index 60534c1..0124b2d 100644
 Arnaud> --- a/package/flot/Config.in
 Arnaud> +++ b/package/flot/Config.in
 Arnaud> @@ -20,6 +20,11 @@ if BR2_PACKAGE_FLOT
 
 Arnaud>  comment "flot plugins"
 
 Arnaud> +config BR2_PACKAGE_FLOT_FILLBETWEEN
 Arnaud> +	bool "fillbetween"
 Arnaud> +	help
 Arnaud> +	  Flot plugin for computing bottoms for filled line and bar charts. 

You have a trailing space here in the help text.

Otherwise it looks good, committed - Thanks.

-- 
Bye, Peter Korsgaard
