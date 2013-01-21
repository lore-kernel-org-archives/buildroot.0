From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 21 Jan 2013 09:26:37 +0100
Subject: [Buildroot] [PATCH 3/4] lttng-libust: bump to version 2.1.1
In-Reply-To: <26be851b0e776f7f6f969962d9b571498b30c127.1358593210.git.s.martin49@gmail.com>
 (Samuel Martin's message of "Sat, 19 Jan 2013 12:03:47 +0100")
References: <cover.1358593210.git.s.martin49@gmail.com>
 <cover.1358593210.git.s.martin49@gmail.com>
 <26be851b0e776f7f6f969962d9b571498b30c127.1358593210.git.s.martin49@gmail.com>
Message-ID: <877gn7aqma.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 Samuel> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 Samuel> ---
 Samuel>  package/lttng-libust/lttng-libust.mk | 2 +-
 Samuel>  1 file changed, 1 insertion(+), 1 deletion(-)

 Samuel> diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
 Samuel> index e1f51b1..e143118 100644
 Samuel> --- a/package/lttng-libust/lttng-libust.mk
 Samuel> +++ b/package/lttng-libust/lttng-libust.mk
 Samuel> @@ -4,7 +4,7 @@
 Samuel>  #
 Samuel>  #############################################################
 Samuel>  LTTNG_LIBUST_SITE    = http://lttng.org/files/lttng-ust/
 Samuel> -LTTNG_LIBUST_VERSION = 2.1.0
 Samuel> +LTTNG_LIBUST_VERSION = 2.1.1

The autobuilders are not happy. Did you perhaps forget to drop
lttng-libust-dont-build-cxx-tests-when-not-available.patch?

-- 
Bye, Peter Korsgaard
