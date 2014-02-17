From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Feb 2014 11:32:19 +0100
Subject: [Buildroot] [PATCH 02/29] ARC: [eznps] support OVERRIDE_SRCDIR
 feature for uclibc
In-Reply-To: <884EA965490E3C4D8E66AEF41E980250060E6E@ezex10.ezchip.com>
References: <264C179F799EF24AB26D5319053335E80E59BD78A3@ezexch.ezchip.com>
 <20131223085236.4da230a4@skate>
 <884EA965490E3C4D8E66AEF41E980250060E6E@ezex10.ezchip.com>
Message-ID: <20140217113219.5da02ed6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Noam Camus,

On Mon, 17 Feb 2014 08:10:17 +0000, Noam Camus wrote:

> Is there anything I can do to help in applying those commits?
> 
> Noam
> Note: at the moment only one out of five was applied.

Yes, I believe you could resend them, rebased on top of the current
-next branch, in a patch series that only includes those patches (the
fact that you sent only 5 patches, but they were number <something>/29
was quite confusing).

Also, make sure each of your commits has a long enough commit log to
allow reviewers to understand what problem the commit is fixing, and
how the solution works.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
