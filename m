From: Marcel <korgull@home.nl>
Date: Sun, 20 Dec 2009 17:05:11 +0100
Subject: [Buildroot] develop using buildroot
In-Reply-To: <2daf59620912200746q71473c64r16ce13b9ef7e197c@mail.gmail.com>
References: <200912201506.20584.korgull@home.nl>
	<2daf59620912200746q71473c64r16ce13b9ef7e197c@mail.gmail.com>
Message-ID: <200912201705.12045.korgull@home.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Hedwin,

That's exactly how I work now. 

I am just going through the pains of getting my initial environment to work 
but I'm almost there I think.
u-boot, kernel and most packages build fine, just the rootfs misses some items 
like /root/etc/passwd. I guess I forgot something along the way.

Regards,
Marcel

> Hallo Marcel,
> 
> Not sure there is a better way, what you need to look at is what makes
> it work for you.
> 
> In my case for example I use buildroot to create a root filesystem
> while I maintain the kernel and u-boot outside buildroot using git.
> That works for me.
> 
> Hedwin
> 
> On Sun, Dec 20, 2009 at 3:06 PM, Marcel <korgull@home.nl> wrote:
> > Hi,
> >
> > I'm having some issues setting up a workable environment.
> > I need to write my own kernel drivers, add some packages and change
> > u-boot.
> >
> > buildroot requires patches, so that's clear but I wonder how to
> > efficiently develop those patches.
> >
> > Do I set up the kernel and u-boot outside buildroot, than create patches
> > form there and than include those in buildroot ?
> >
> > Or, do I compile buildroot, than develop my code from there and generate
> > patches ?
> >
> > Or.....is there a better way ?
> >
> > regards,
> > Marcel
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> 
