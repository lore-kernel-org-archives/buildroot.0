From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2016 13:55:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/procps-ng: bump version to
	3.3.11 to fix musl build
In-Reply-To: <1454241856-27606-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Sun, 31 Jan 2016 13:04:16 +0100")
References: <1454241856-27606-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87wpqpj4ce.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Rebased 0002-use-pkgconfig-for-ncursesw-cflags.patch
 > The build error has not yet been found by the autobuilders:

 > watch.c:564:37: error: request for member ?chars? in something not a structure or union
 >      exit_early = (wchar_t) c != oldc.chars[0];
 >                                      ^
 > watch.c:573:5: error: unknown type name ?cchar_t?
 >      cchar_t oldc;

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
