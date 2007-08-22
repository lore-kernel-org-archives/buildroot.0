From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 22 Aug 2007 23:20:34 +0200
Subject: [Buildroot] Hiding non-buildable packages
In-Reply-To: <1187816364.4321.63.camel@86-115-11-28>
References: <1187728137.6145.48.camel@86-115-11-152>
	<20070822191320.GU11697@aon.at>
	<1187814296.4321.37.camel@86-115-11-28>
	<200708222244.38319.yann.morin.1998@anciens.enib.fr>
	<1187816364.4321.63.camel@86-115-11-28>
Message-ID: <20070822212034.GC11697@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 22, 2007 at 10:59:24PM +0200, Ulf Samuelsson wrote:

>Granted, but do we need it to be perfect?, I think not!
>
>I know that openssh does not work due to lack of 64 bit math.

You are - for the second time today - tempting me to just apply my
openssh update which i know may have trouble in some odd places, just
FYI..
>I do not think it works for any architecture.
>Why should every newbie try this out for themseleves,
>only to find that it does not build...

Since the default works fine, if somebody tries hard to shoot themselves
in the foot, why prevent them from doing so?
>
>Much better to hide it from the build, and then let the guy
>which really wants it to reenable and debug it.

No. That's not my approach.
Let defaults work, if you change anything, be prepared to keep all
parts.
