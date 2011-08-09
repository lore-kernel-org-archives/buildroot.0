From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 09 Aug 2011 21:44:59 +0200
Subject: [Buildroot] linphone package
In-Reply-To: <201108092140.21886.yann.morin.1998@anciens.enib.fr> (Yann
 E. MORIN's message of "Tue, 9 Aug 2011 21:40:21 +0200")
References: <4E413EB9.6040504@fosstel.com>
 <201108092056.40244.yann.morin.1998@anciens.enib.fr>
 <87r54uie0h.fsf@macbook.be.48ers.dk>
 <201108092140.21886.yann.morin.1998@anciens.enib.fr>
Message-ID: <87mxfiid38.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

 Yann> Peter, All,
 Yann> On Tuesday 09 August 2011 21:25:02 Peter Korsgaard wrote:
 Yann> Maybe it would make sense to add this to the auto-target infrastructure?
 Yann> Either it is unconditionally added, or the package can set a variable to
 Yann> use it, eg. PKG_CONF_PROG_PREFIX = YES
 >> 
 >> Unconditional should be ok, similar to how we do the ipv6 / nls stuff.

 Yann> OK.

 Yann> I'm also removing it from PKG_CONF_OPT variables. Do you want a
 Yann> single patch that removes all instances in one go, or do you want
 Yann> one patch per package?  I'm tempted to do the latter, so we can
 Yann> revert only those that break.

Up to you. Seems we have it in 21 files. I'll prefer to only commit
post-2011.08 though.

-- 
Bye, Peter Korsgaard
