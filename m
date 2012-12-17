From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 17 Dec 2012 21:42:32 +0100
Subject: [Buildroot] [PATCH] imx-lib: new package
In-Reply-To: <50CF5761.7030902@mind.be> (Arnout Vandecappelle's message of
 "Mon, 17 Dec 2012 18:33:21 +0100")
References: <1355752131-31966-1-git-send-email-arnout@mind.be>
 <50CF3F4D.1030100@mind.be> <871ueo8y7k.fsf@dell.be.48ers.dk>
 <50CF5761.7030902@mind.be>
Message-ID: <87r4mo76mf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 >> Another possibility is to bundle the needed kernel headers with the
 >> package, similar to how E.G. mtd-utils does it.

 Arnout>  Unfortunately, Freescale probably has a much lower standard about ABI
 Arnout> compatibility than kernel.org. Also it's relatively likely that a
 Arnout> buildroot user will use a different Freescale kernel than the one
 Arnout> assumed by buildroot. So you may end up with userspace assuming
 Arnout> different struct layouts than the kernel...

Yeah, closed source mess :/

-- 
Bye, Peter Korsgaard
