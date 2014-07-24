From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 24 Jul 2014 07:28:02 +0200
Subject: [Buildroot] [PATCH] sna/dri2: Protect compsiteext.h include
	with build check
References: <1405661249-6506-1-git-send-email-ben@bwidawsk.net>
 <1405665634-3299-1-git-send-email-chris@chris-wilson.co.uk>
 <20140718232336.GA5940@bwidawsk.net>
 <20140723234458.7399f7b6@free-electrons.com>
 <20140723223626.GA759@bwidawsk.net>
Message-ID: <XnsA3744BF59EAA9berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ben Widawsky <ben@bwidawsk.net> wrote in
news:20140723223626.GA759 at bwidawsk.net: 

> In the most ideal case, we could just bump to the recently released .913
> and have everything /just/ work. Chris has fixed 2 bugs that Bernd's
> series also attempted to fix. Of course that runs the risk of invoking
> the wrath that caused the original .912 revert.

Hi,

yesterday I tried .914, without success:
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/90194 

Then I reverted back to .911, which works again without problems.
Are you able to do run-time tests on your machine with .914?

Regards, Bernd
