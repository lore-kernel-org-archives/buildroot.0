From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 10 Jun 2008 22:08:21 +0200
Subject: [Buildroot] root login password
In-Reply-To: <2590773a0806101254u4444c68dxe04f4dd117fef179@mail.gmail.com>
	(Christopher Taylor's message of "Tue\,
	10 Jun 2008 15\:54\:55 -0400")
References: <2590773a0806101254u4444c68dxe04f4dd117fef179@mail.gmail.com>
Message-ID: <87zlptuk7e.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christopher" == Christopher Taylor <chtaylo3@gmail.com> writes:

 Christopher> On some builds root needs to supply a password for
 Christopher> logging in over telnet or through g_serial and on some
 Christopher> builds it doesn't.  No matter what, it can always login
 Christopher> without the password on the debug serial (ttyS3 for me).

Strange. Is your /etc/{passwd,shadow} files the same? Do you have
g_serial in /etc/securetty?

-- 
Bye, Peter Korsgaard
