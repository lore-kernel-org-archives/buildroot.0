From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 Feb 2014 22:43:53 +0100
Subject: [Buildroot] [PATCH] package/ti-gfx: do not forcefully remove
	source dir on extract
In-Reply-To: <530E5DAE.8030609@mind.be> (Arnout Vandecappelle's message of
 "Wed, 26 Feb 2014 22:33:34 +0100")
References: <1393440003-29380-1-git-send-email-yann.morin.1998@free.fr>
 <530E5DAE.8030609@mind.be>
Message-ID: <87bnxtczxi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 26/02/14 19:40, Yann E. MORIN wrote:
 >> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 >> 
 >> ti-gfx uses custom extract commands, which first and foremost removes
 >> the source dir unconditionally.
 >> 
 >> Thee side-effect of this is that make will re-extract, re-patch and
 >> probably re-build ti-gfx at each run.

 >  There actually was a reason for this - I think the extract fails if you
 > re-run it. Have you tried

 > make ti-gfx-extract; make ti-gfx-extract

That afaik simply says nothing to do, like it should.

-- 
Bye, Peter Korsgaard
