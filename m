From: John Voltz <john.voltz@gmail.com>
Date: Wed, 30 Apr 2008 10:46:29 -0400
Subject: [Buildroot] x86 image for download
In-Reply-To: <326f33790804292359j6c46b3a5ya769efd022a30999@mail.gmail.com>
References: <46a136670804291039y34a80ff2p70bd4d38a63ffcf@mail.gmail.com>
	<48181753.50707@gmail.com>
	<326f33790804292359j6c46b3a5ya769efd022a30999@mail.gmail.com>
Message-ID: <46a136670804300746u484199b3nc245522b184f6b34@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The thing is, it should just work for everyone. I'm working on a fix for
libtool right now, that was the major stumbling block for building for x86.
Libtool is relinking the libraries with -rpath=/usr/lib which is no good.
I'm taking care of that little nasty. I'm also going to work at integrating
the bootable ext3 option into menuconfig.

John


On Wed, Apr 30, 2008 at 2:59 AM, Arun Reddy <reddyac@gmail.com> wrote:

> I'd like to second this request as well! I recently got a bootable x86
> image working and successfully converted it to a .vdi to be used in
> VirtualBox. It would be nice to see how a professional does it so maybe I
> can learn to optimize my method.
>
> On Tue, Apr 29, 2008 at 11:53 PM, Joe <zentrale.at.work@gmail.com> wrote:
>
> > Hi John, thanks for sharing! Looks really interesting to me...
> >
> > > I finally created a bootable x86 image using buildroot, and a lot of
> > > hand-copying of files to my target dir.
> > Is it really complicated, or can you maybe do some short guide on how
> > you did it? This could be a very efficient way to set up special-purpose
> > machines in vmware...
> >
> > Thanks again, Joe
> >
> > --
> > Sepp "ZaP" Holzmayr
> >
> > please reply to: zentrale.at.work at gmail.com
> > "Never underestimate the bandwidth of a freight train full of DAT tapes.
> > Only the round-trip is a little suboptimal."
> > _______________________________________________
> > buildroot mailing list
> > buildroot at uclibc.org
> > http://busybox.net/mailman/listinfo/buildroot
> >
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080430/6b99623e/attachment.htm 
