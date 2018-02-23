From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Feb 2018 16:51:58 +0100
Subject: [Buildroot] [PATCH] iptables: bump to version 1.6.2
In-Reply-To: <20180223145243.GH2686@kwain> (Antoine Tenart's message of "Fri, 
 23 Feb 2018 15:52:43 +0100")
References: <20180223095200.31819-1-antoine.tenart@bootlin.com>
 <87k1v3pzbs.fsf@dell.be.48ers.dk> <20180223145243.GH2686@kwain>
Message-ID: <87fu5rpuu9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Antoine" == Antoine Tenart <antoine.tenart@bootlin.com> writes:

 > Hi Peter,
 > On Fri, Feb 23, 2018 at 03:15:03PM +0100, Peter Korsgaard wrote:
 >> >>>>> "Antoine" == Antoine Tenart <antoine.tenart@bootlin.com> writes:
 >> 
 >> > Also removed a patch fixing the build with musl as it made its way into
 >> > the 1.6.2 version.
 >> 
 >> Thanks. Should this go to master or next? Does this fix any important
 >> issues?

 > I'd say this can go to next (btw, is there a specific tag to set in the
 > subject?).

Ok. We normally mark these with NEXT.


 > I did this while compiling with RELRO and fortify source enabled, and
 > updating the version did solve a build issue.

Ahh, you were the one having build failures with RELRO ;)

 > But these two compilation options are highly experimental from what I
 > understood and other packages are failing to build anyway, so I
 > wouldn't say this is a real fix for the current version :)

Ok - Committed to next, thanks.

-- 
Bye, Peter Korsgaard
