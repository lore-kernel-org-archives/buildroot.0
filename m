From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 22 Jan 2013 23:01:48 +0100
Subject: [Buildroot] [PATCH v4 2/2] Media-ctl: new package
In-Reply-To: <1358849373-20243-2-git-send-email-kpa_info@yahoo.fr> (Patrick
 Gerber's message of "Tue, 22 Jan 2013 11:09:33 +0100")
References: <1358849373-20243-1-git-send-email-kpa_info@yahoo.fr>
 <1358849373-20243-2-git-send-email-kpa_info@yahoo.fr>
Message-ID: <87zk003mib.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Patrick" == Patrick Gerber <kpa_info@yahoo.fr> writes:

 Patrick> Signed-off-by: Patrick Gerber <kpa_info@yahoo.fr>
 Patrick> ---
 Patrick>  package/Config.in              |    1 +
 Patrick>  package/media-ctl/Config.in    |    7 +++++++
 Patrick>  package/media-ctl/media-ctl.mk |   17 +++++++++++++++++
 Patrick>  3 files changed, 25 insertions(+)
 Patrick>  create mode 100644 package/media-ctl/Config.in
 Patrick>  create mode 100644 package/media-ctl/media-ctl.mk

 Patrick> diff --git a/package/Config.in b/package/Config.in
 Patrick> index 39e2ec7..7856ff2 100644
 Patrick> --- a/package/Config.in
 Patrick> +++ b/package/Config.in
 Patrick> @@ -251,6 +251,7 @@ source "package/lshw/Config.in"
 Patrick>  source "package/lsuio/Config.in"
 Patrick>  source "package/lvm2/Config.in"
 Patrick>  source "package/mdadm/Config.in"
 Patrick> +source "package/media-ctl/Config.in"
 Patrick>  source "package/memtester/Config.in"
 Patrick>  source "package/minicom/Config.in"
 Patrick>  source "package/nanocom/Config.in"
 Patrick> diff --git a/package/media-ctl/Config.in b/package/media-ctl/Config.in
 Patrick> new file mode 100644
 Patrick> index 0000000..832089f
 Patrick> --- /dev/null
 Patrick> +++ b/package/media-ctl/Config.in
 Patrick> @@ -0,0 +1,7 @@
 Patrick> +config BR2_PACKAGE_MEDIA_CTL
 Patrick> +	bool "media-ctl"
 Patrick> +	help
 Patrick> +	  Media controller control application
 Patrick> +	  Usefull mostly with ARM OMAP processors to configure and control the image subsystem

s/usefull/useful/

Please keep help lines to ~70 chars so it fits in menuconfig in a normal
80 col screen without scrolling.

Committed with this fixed, thanks.

-- 
Bye, Peter Korsgaard
