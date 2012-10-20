From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 20 Oct 2012 21:06:12 +0200
Subject: [Buildroot] [PATCH] toolchain: have check_glibc to search
	deeper for ld-linux
In-Reply-To: <1350073550-779-1-git-send-email-jean-mickael.guerin@6wind.com>
 (Jean-Mickael Guerin's message of "Fri, 12 Oct 2012 22:25:50 +0200")
References: <1350073550-779-1-git-send-email-jean-mickael.guerin@6wind.com>
Message-ID: <878vb1ufob.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jean-Mickael" == Jean-Mickael Guerin <jean-mickael.guerin@6wind.com> writes:

 Jean-Mickael> ld-linux*.so may not be present in lib/ directory, it could be
 Jean-Mickael> in lib32 and/or lib64 only. But check_glibc reports
 Jean-Mickael> "Incorrect selection of the C library" in this case, which is
 Jean-Mickael> not true.
 Jean-Mickael> Fixed by extending the search to  SYSROOT/*/*.

Committed, thanks.

-- 
Bye, Peter Korsgaard
