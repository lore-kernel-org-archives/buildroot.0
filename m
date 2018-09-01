From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 01 Sep 2018 23:16:06 +0200
Subject: [Buildroot] [PATCH] package/squashfs: fix build on hosts with
 glibc >= 2.28
In-Reply-To: <a178b07f64674107d4db38b4fc4eb21c2e44bfe1.camel@web.de> (Richard
 Kunze's message of "Sat, 01 Sep 2018 16:55:03 +0200")
References: <20180825200751.28097-1-richard.kunze@web.de>
 <20180827063731.m3xm4jamqyugxfwm@sapphire.tkos.co.il>
 <a178b07f64674107d4db38b4fc4eb21c2e44bfe1.camel@web.de>
Message-ID: <87ftys6hrd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Richard" == Richard Kunze <richard.kunze@web.de> writes:

Hi,

 >> It would also be nice to add a note about the upstream status of this
 >> patch.

 > The problem here is I don't really know how to contact upstream.

 > The Buildroot makefile references 
 > https://git.kernel.org/pub/scm/fs/squashfs/squashfs-tools.git but that
 > has no bug tracker or contact information for patches. The original (?)
 > site at sourceforge.net seems pretty much dead. 

 > I finally found https://github.com/plougher/squashfs-tools which seems
 > at least somewhat active, and there is already a pull request for the
 > same problem: https://github.com/plougher/squashfs-tools/pull/52

 > Would it be OK to take the buildroot patch from this pull request as
 > per Buildroot manual section 18.4?

Yes, I believe so. plougher sounds like Phillip Lougher, the original
author of squashfs, and patrickdepinguin (Thomas) is a regular buildroot
contributor.

Will you send a patch? Thanks!

-- 
Bye, Peter Korsgaard
