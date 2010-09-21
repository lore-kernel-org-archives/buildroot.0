From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 21 Sep 2010 19:39:39 +0200
Subject: [Buildroot] make lzo not find utime.h
In-Reply-To: <AANLkTikwGZ5sB6p873bDt8m-UVaAikMJjQ3U=5N-h2GF@mail.gmail.com>
	(icemanpro@gmail.com's message of "Tue, 14 Sep 2010 18:18:29 +0800")
References: <AANLkTikwGZ5sB6p873bDt8m-UVaAikMJjQ3U=5N-h2GF@mail.gmail.com>
Message-ID: <87hbhj0zdw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "icemanpro" == icemanpro  <icemanpro@gmail.com> writes:

 icemanpro> Hi, everyone
 icemanpro> ?I "make i686_defconfig" in buildroot directory.and when make lzotest
 icemanpro> has an error:"error: utime.h:?No such file?or directory"

 icemanpro> how to fix this bug?

i686_defconfig was using the wrong uClibc configuration, but that is now
fixed in git - Could you give it another try?

-- 
Bye, Peter Korsgaard
