From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Sep 2014 10:52:54 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-09-09
In-Reply-To: <87r3zjeui5.fsf@dell.be.48ers.dk>
References: <20140910063013.732CF1018B1@stock.ovh.net>
 <87vbovewb3.fsf@dell.be.48ers.dk>
 <20140910101455.016ca634@free-electrons.com>
 <87r3zjeui5.fsf@dell.be.48ers.dk>
Message-ID: <20140910105254.2a7b582e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 10 Sep 2014 10:42:58 +0200, Peter Korsgaard wrote:

>  > So the policy is now that curses is no longer mandatory, and we should
>  > depend on host-ncurses when needed?
> 
> Wasn't that just what we agreed upon? We require it on the host for the
> menuconfig target, but build host-ncurses for the packages that need it.

It wasn't entirely clear to me that we had reached an agreement. But
I'm ok with this decision, so fair enough. It however means that we
should *remove* libncurses-dev from the autobuilder chroots when
possible.

>  > Maybe we could also add a depends on BR2_arm, because building
>  > snowball-hdmiservice on Blackfin seems a bit odd :)
> 
> Yes, or simply deprecate the snowball packages. The board isn't
> available any more and imho had quite a small community.

Indeed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
