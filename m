From: Ulf Samuelsson <ulf@atmel.com>
Date: Sat, 29 Sep 2007 13:40:36 +0200
Subject: [Buildroot] spurious rebuilds? Re: svn commit:	trunk/buildroot:
	target/linux toolchain/uClibc
In-Reply-To: <20070928202708.GV20951@aon.at>
References: <20070928194327.E4F34A69E5@busybox.net>
	<20070928202708.GV20951@aon.at>
Message-ID: <1191066036.5322.259.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fre 2007-09-28 klockan 22:27 +0200 skrev Bernhard Fischer:
> On Fri, Sep 28, 2007 at 12:43:27PM -0700, ulf at uclibc.org wrote:
> >Author: ulf
> >Date: 2007-09-28 12:43:26 -0700 (Fri, 28 Sep 2007)
> >New Revision: 20088
> >
> >Log:
> >Cleanup cross toolchain admin, split uclibc-menuconfig into same + uclibc-update to avoid overwriting board support file
> 
> Ulf,
> 
> With these two changes (this one and the previous that touched these),
> can you please build an image (with tarroot off), and then turn tarroot
> on and make again.
> I'm pretty sure that this used to just regenerate the target
> "filesystems" and didn't lead to a complete rebuild (that i'm currently
> enjoying)..
> 
Noticed the rebuild.
I think this was the host-sed which apparently got touched somewhere
for some obscure reason!!! Any clue why?

I removed the dependency of uclibc on host-sed and at
least uclibc did not get rebuilt..

I will test again.
BR
ULf


> Please confirm.
