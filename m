From: Petr Vorel <petr.vorel@gmail.com>
Date: Sat, 31 Oct 2015 21:45:51 +0100
Subject: [Buildroot] [PATCH 1/1] ofono: bump to version 1.17
In-Reply-To: <20151031155550.0c2636b8@free-electrons.com>
References: <1446230985-12935-1-git-send-email-petr.vorel@gmail.com>
 <20151031155550.0c2636b8@free-electrons.com>
Message-ID: <20151031204550.GA25719@t61>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

> However, their patch for the musl build is really crappy. Instead, they
> should add a configure.ac check for the backtrace related functionality
> and use the result of that check instead of testing __GLIBC__. If you
> have the courage to improve this and submit it upstream, it would be
> good.
I'll do it :-).
I suppose it's enough just to improve check for execinfo.h header and backtrace function.

Kind regards,
Petr
