From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 28 May 2009 22:58:49 +1000
Subject: [Buildroot] 2009.05-rc3 released
In-Reply-To: <87ws8176y8.fsf@macbook.be.48ers.dk>
References: <87k5428ixt.fsf@macbook.be.48ers.dk>
	<56ea0bb80905272131h4aac2dceh86b7b8636031dc7d@mail.gmail.com>
	<87ws8176y8.fsf@macbook.be.48ers.dk>
Message-ID: <20090528125849.GA23420@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, May 28, 2009 at 02:22:39PM +0200, Peter Korsgaard wrote:
> >>>>> "Paul" == Paul Archer <ptarcher@gmail.com> writes:
> 
>  Paul> On Thu, May 28, 2009 at 5:06 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>  >> And report any issues found here or in the bugtracker.
>  Paul> I have been trying to build buildroot with a ubifs image. I haven't
>  Paul> quite got there yet, but there are some bugs associated with this
>  Paul> version.
> 
>  Paul> target/ubifs/ubifsroot.mk
>  Paul> $(call DOWNLOAD,"$(MKFS_UBIFS_URL)")
> 
>  Paul> This should be a WGET, not a DOWNLOAD.
> 
> Thanks - Will fix. I just gave it a test, and it seems like the
> upstream git tree is gone, so it won't help you much.
> 
> Hamish, I believe you were the one adding ubifs support - What is the
> situation with mkfs.ubifs? Is upstream mtd-utils nowadays like
> mkfs.jff2?
> 
> Seems like we'll have to make ubifsroot as broken for the 2009.05
> release :/

Oh, I fixed this in my tree at work I'm pretty sure, but obviously forgot 
to send in a patch. mkfs.ubifs is included in mtd-utils now, but you have 
to use the git version (it's not in an mtd-utils release).

I haven't kept up with official buildroot lately, especially since the
switch to git. I'll see if I can send a patch to the mailing list
tomorrow.. I can't get to my code right now.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
