From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 09 Dec 2012 21:44:37 +0100
Subject: [Buildroot] [PATCH] fbv: add license info
In-Reply-To: <50C4A8CD.2090407@mind.be> (Arnout Vandecappelle's message of
 "Sun, 09 Dec 2012 16:05:49 +0100")
References: <1354875156-28654-1-git-send-email-sho@relinux.de>
 <50C4A8CD.2090407@mind.be>
Message-ID: <87r4mzvtu2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> +FBV_LICENSE = GPLv2

 Arnout>  Although the README and COPYING files claim it's version 2,
 Arnout> all source files say version 2 or later.

 Arnout>  I'm not sure what to do here.  The safe option is:

 Arnout> FBV_LICENSE = GPLv2 (or later?)

Or simply GPLv2. It might allow later as well, but GPLv2 is certainly
true.

-- 
Bye, Peter Korsgaard
