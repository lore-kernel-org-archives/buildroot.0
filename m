From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 20 Oct 2008 11:05:16 +0200
Subject: [Buildroot] Can not compile strace
In-Reply-To: <76d9e2a30810191813s629af379kedd4da294a8f7cf2@mail.gmail.com>
	(Hai Zaar's message of "Mon\, 20 Oct 2008 03\:13\:34 +0200")
References: <76d9e2a30810191813s629af379kedd4da294a8f7cf2@mail.gmail.com>
Message-ID: <87ljwjljqr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hai" == Hai Zaar <haizaar@haizaar.com> writes:

 Hai> I'm building current buildroot with 2.6.27 for at91sam9260
 Hai> strace fails to compile with the following error:
 Hai> file.c:41:26: error: linux/dirent.h: No such file or directory

 Hai> It looks like build_arm/staging_dir/usr/include/linux/dirent.h does
 Hai> not exist any more.
 Hai> How can I fix that?

Thanks for reporting it - Fixed in r23735.

-- 
Bye, Peter Korsgaard
