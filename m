From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 02 Jul 2013 23:09:30 +0200
Subject: [Buildroot] [PATCH 1/8] lttng-tools: bump version to 2.2.0
In-Reply-To: <1372604469-24361-1-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sun, 30 Jun 2013 17:01:02 +0200")
References: <1372604469-24361-1-git-send-email-s.martin49@gmail.com>
Message-ID: <87li5osm7p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 Samuel> Remove lttng-tools-no-sync-file-range-in-uclibc.patch because it got
 Samuel> merged upstream.

 Samuel> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

 Samuel> index 77bf7d6..992ecad 100644
 Samuel> --- a/package/lttng-tools/lttng-tools.mk
 Samuel> +++ b/package/lttng-tools/lttng-tools.mk
 Samuel> @@ -4,7 +4,7 @@
 Samuel>  #
 Samuel>  ################################################################################
 
 Samuel> -LTTNG_TOOLS_VERSION = 2.1.1
 Samuel> +LTTNG_TOOLS_VERSION = 2.2.0

It seems like it has grown a libuuid dependency. Care to have a look?

http://autobuild.buildroot.net/results/fa2/fa2d699901b72d36c5ac3078ef0e7bad2002b9d5/build-end.log

-- 
Bye, Peter Korsgaard
