From: Bobby Ramsook <bobby.83x2@gmail.com>
Date: Thu, 15 Feb 2007 02:41:02 -0500
Subject: [Buildroot] Problem building build root in a squashhfs image
In-Reply-To: <12d878080702142303k63ed50a7jb99f7b5d3bf21617@mail.gmail.com>
References: <12d878080702111341q1b2b9468w53aff97f6c6ccb0c@mail.gmail.com>
	<20070212090729.58cf28f0.philippe.ney@pardes.ws>
	<12d878080702142303k63ed50a7jb99f7b5d3bf21617@mail.gmail.com>
Message-ID: <12d878080702142341q47408d7fib76e4954763a3677@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I dont supposed the admin of the list can remove that telephone number on my
last post?

On 2/15/07, Bobby Ramsook <bobby.83x2@gmail.com> wrote:
>
> So I was looking throught the target/linux26.mk
> and I noticed the linux26-menuconfig
> but when I run it I get:
>
> bobby at ubuntu:/usr/src/buildroot$ make linux26-menuconfig
> make: *** No rule to make target `/usr/src/buildroot/build_i686/linux-
> 2.6.12/.patched', needed by `linux26-menuconfig'.  Stop.
>
> The source is from the svn checkout date 2-11-07
>
>
> On 2/12/07, Philippe Ney < philippe.ney@pardes.ws> wrote:
> >
> > > I Have been trying to compile buildroot, but i keep getting stuck on
> > the
> > > following error:
> > >
> > > make: *** No rule to make target
> > > `/usr/src/buildroot/build_i586/linux-2.6.12/.patched',
> > > needed by `/usr/src/buildroot/build_i586/linux- 2.6.12
> > /.configured'.  Stop.
> >
> > Hi,
> >
> > If you copy-paste the error in the mail, then it's certainly due to the
> > space character.
> >
> > Otherwise, check the linux.mk makefile.
> >
> > Philippe
> > _______________________________________________
> > buildroot mailing list
> > buildroot at uclibc.org
> > http://busybox.net/mailman/listinfo/buildroot
> >
>
>
>
> --
> Bobby Ramsook
> CCNY Computer Tech
> Grad Date (EXP):  07'
>



-- 
Bobby Ramsook
CCNY Computer Tech
Grad Date (EXP):  07'
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070215/54f08197/attachment.html 
