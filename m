From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 13 Jun 2012 23:48:57 +0200
Subject: [Buildroot] [PATCH] Update gdisk (gptfdisk) to version 0.8.5.
In-Reply-To: <1339015420-25728-1-git-send-email-jmaggard10@gmail.com> (Justin
 Maggard's message of "Wed, 6 Jun 2012 13:43:40 -0700")
References: <1339015420-25728-1-git-send-email-jmaggard10@gmail.com>
Message-ID: <87zk86x4qe.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Justin" == Justin Maggard <jmaggard10@gmail.com> writes:

 Justin> Update GPT fdisk utility to upstream version 0.8.5.


 Justin> Signed-off-by: Justin Maggard <jmaggard10@gmail.com>
 Justin> ---
 Justin>  package/gdisk/gdisk-0.6.14-uuid.h.patch  |   22 ------------------
 Justin>  package/gdisk/gdisk-0.8.5-no-utf16.patch |   37 ++++++++++++++++++++++++++++++

 Justin> diff --git a/package/gdisk/gdisk-0.8.5-no-utf16.patch b/package/gdisk/gdisk-0.8.5-no-utf16.patch
 Justin> new file mode 100644
 Justin> index 0000000..54e55f6
 Justin> --- /dev/null
 Justin> +++ b/package/gdisk/gdisk-0.8.5-no-utf16.patch
 Justin> @@ -0,0 +1,37 @@
 Justin> +diff -ur gdisk-0.8.5/Makefile gptfdisk-0.8.5/Makefile

Did you miss Thomas' review feedback?

-- 
Bye, Peter Korsgaard
