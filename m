From: David Purdy <david.c.purdy@gmail.com>
Date: Tue, 22 May 2012 14:01:42 -0500
Subject: [Buildroot] Buildroot's busybox-lpr + p910nd
Message-ID: <CAPOFwxr1AOxyquC3d_WV4Cf0Yh8y2KQr85Z+3i_fotpqDHg9GQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas  et al:

I've put together a package/recipe for  p910nd  on Buildroot, it
compiles fine.   I will submit it via list for inclusion in one of the
upcoming releases.

But ...  it doesn't seem to execute correctly.   Of course, I've
built-in strace in my UBIFS image, so I can post back w/ strace output for
perusal and hopefully someone can spot the problem, if I haven't
found the problem myself w/i  few days.

Two focused questions:

1.  Is there anything "socket-related-ish"  (port 910x  x=0,1,2)  that
is odd or different in the Busybox implementations of lpr ?  Is there
any crucial capability that it is missing that would prevent it from
working w/  p910nd (a nonspooling print server that links networked
computers to a port 910x on the  host, and passes the raw feed to the
USB Printer).

2.   I couldn't find anything in the mailing list regarding previous
efforts to use p910nd in Buildroot w/ busybox's lpr.   Maybe its there
and I just missed it?  Does it ring a bell for anyone?


thanks,

Dave
