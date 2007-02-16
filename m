From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 16 Feb 2007 09:30:19 +0100
Subject: [Buildroot] Preferred procedure for submitting patches?
In-Reply-To: <20070215220929.GA1805@foogod.com>
References: <20070215220929.GA1805@foogod.com>
Message-ID: <20070216083019.GA27053@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 15, 2007 at 02:09:29PM -0800, Alex Stewart wrote:
>Hi all..
>
>I was wondering what the preferred method for submitting patches to buildroot
>is?  I've recently submitted several patches through the bug reporting system,
>but now I'm noticing that there seem to be other patches in the bug system from
>several months ago (bug 1094, for example, which I just noticed is basically a
>duplicate of something I just submitted, that somebody else provided a fix for
>last November) that still apparently haven't been applied to the current
>sources, so now I'm beginning to wonder whether anybody's really paying
>attention to the bug system?

Given that there were more than 250 open buildroot bugs in november and
we already were < 75 last time i looked, yes, i'm slowly going through
the bugs entered there.

Some categories of reports i cannot really deal with (cannot emulate the
arch the bug is reported against and noone is able/willing to provide a
kernel .config that i can use qith e.g. qemu).
Other categories (external toolchain, ancient versions that have working
current counterparts) i don't care about, personally.

>
>Is there some other method I should be using to submit patches to make sure
>they make it into the distribution in a timely fashion?

Submitting patches to the bugtracker is nice, provided that it comes
along a good description of the problem/feature it is solving and/or has
a way to reproduce the failure while i can actually _test_ that the
outcome works for an emulated target.
Sometimes i ask that patches are also sent to the list. Patches that are
solely sent to the list are sometimes lost if noone immediately "takes"
them, of course.

The timely bit could be solved by paying somebody. Ask Erik or whomever
if you want this. I'm just a volunteer, ultimately, so i'm not going to
adhere to anybody putting any constraints on me in this respect ;)

HTH. Cheers,
