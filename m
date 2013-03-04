From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 Mar 2013 10:29:14 +0100
Subject: [Buildroot] [PATCH 11/33] ltp-testsuite: fix build on uClibc
	exp10
In-Reply-To: <1353543503-8952-12-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Thu, 22 Nov 2012 01:18:01 +0100")
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
 <1353543503-8952-12-git-send-email-s.martin49@gmail.com>
Message-ID: <87a9qjecnp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 Samuel> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 Samuel> ---
 Samuel>  ...tsuite-20101031-fix-build-on-uClibc-exp10.patch | 22 ++++++++++++++++++++++
 Samuel>  1 file changed, 22 insertions(+)
 Samuel>  create mode 100644 package/ltp-testsuite/ltp-testsuite-20101031-fix-build-on-uClibc-exp10.patch

 Samuel> diff --git a/package/ltp-testsuite/ltp-testsuite-20101031-fix-build-on-uClibc-exp10.patch b/package/ltp-testsuite/ltp-testsuite-20101031-fix-build-on-uClibc-exp10.patch
 Samuel> new file mode 100644
 Samuel> index 0000000..7a02d95
 Samuel> --- /dev/null
 Samuel> +++ b/package/ltp-testsuite/ltp-testsuite-20101031-fix-build-on-uClibc-exp10.patch
 Samuel> @@ -0,0 +1,22 @@
 Samuel> +Inspired by: http://peter.korsgaard.com/patches/alsa-utils/alsamixer-fix-build-on-uClibc-exp10.patch

Nice ;)

Committed, thanks.

-- 
Bye, Peter Korsgaard
