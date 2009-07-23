From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 23 Jul 2009 23:56:40 +0200
Subject: [Buildroot] [PATCH] libmms: new package
In-Reply-To: <1248356767-27956-1-git-send-email-s.neumann@raumfeld.com> (Sven
	Neumann's message of "Thu\, 23 Jul 2009 15\:46\:07 +0200")
References: <1248356767-27956-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <874ot3awrr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> LibMMS is a common library for parsing mms:// and mmsh:// type network
 Sven> streams.

 Sven> Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
 Sven> ---
 Sven>  package/multimedia/Config.in        |    1 +
 Sven>  package/multimedia/libmms/Config.in |   11 +++++++++++
 Sven>  package/multimedia/libmms/libmms.mk |   17 +++++++++++++++++
 Sven>  3 files changed, 29 insertions(+), 0 deletions(-)
 Sven>  create mode 100644 package/multimedia/libmms/Config.in
 Sven>  create mode 100644 package/multimedia/libmms/libmms.mk

 Sven> diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
 Sven> index 1b6cfbd..d00abab 100644
 Sven> --- a/package/multimedia/Config.in
 Sven> +++ b/package/multimedia/Config.in
 Sven> @@ -14,6 +14,7 @@ source "package/multimedia/gst-plugins-bad/Config.in"
 Sven>  source "package/multimedia/gst-plugins-ugly/Config.in"
 Sven>  source "package/multimedia/libid3tag/Config.in"
 Sven>  source "package/multimedia/libmad/Config.in"
 Sven> +source "package/multimedia/libmms/Config.in"
 Sven>  source "package/multimedia/libmpd/Config.in"
 Sven>  source "package/multimedia/libogg/Config.in"
 Sven>  source "package/multimedia/libsndfile/Config.in"
 Sven> diff --git a/package/multimedia/libmms/Config.in b/package/multimedia/libmms/Config.in
 Sven> new file mode 100644
 Sven> index 0000000..8f5cc94
 Sven> --- /dev/null
 Sven> +++ b/package/multimedia/libmms/Config.in
 Sven> @@ -0,0 +1,11 @@
 Sven> +config BR2_PACKAGE_LIBMMS
 Sven> +	bool "libmms"
 Sven> +        select BR2_PACKAGE_LIBGLIB2

spaces instead of tabs. otherwise it looks good - applied.

-- 
Bye, Peter Korsgaard
