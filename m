From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 10 Oct 2012 23:28:44 +0200
Subject: [Buildroot] [PATCH 11/11] libecore: fix build with glibc >=2.16
In-Reply-To: <1342963719-1810-12-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sun, 22 Jul 2012 15:28:39 +0200")
References: <1342963719-1810-1-git-send-email-s.martin49@gmail.com>
 <1342963719-1810-12-git-send-email-s.martin49@gmail.com>
Message-ID: <87ipai584z.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

Hi,

 Samuel> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

 Samuel>  create mode 100644 package/efl/libecore/libecore-ecore_exec-c-fix-build-with-glibc-2-16.patch

 Samuel> diff --git a/package/efl/libecore/libecore-ecore_exec-c-fix-build-with-glibc-2-16.patch b/package/efl/libecore/libecore-ecore_exec-c-fix-build-with-glibc-2-16.patch
 Samuel> new file mode 100644
 Samuel> index 0000000..9d53dfd
 Samuel> --- /dev/null
 Samuel> +++ b/package/efl/libecore/libecore-ecore_exec-c-fix-build-with-glibc-2-16.patch
 Samuel> @@ -0,0 +1,62 @@
 Samuel> +This patch fix build with glibc-2.16, avoiding the following error occurs:
 Samuel> +

Did you send this patch upstream? If so, what is the status of it?

-- 
Bye, Peter Korsgaard
