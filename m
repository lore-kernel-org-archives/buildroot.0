From: Sergio Monteiro Basto <sergio@sergiomb.no-ip.org>
Date: Mon, 14 Feb 2011 14:04:02 +0000
Subject: [Buildroot] How I upgrade busybox from 1.1.3 to busybox 1.17
 without change init scripts ? Was: [PATCH] mplayer: bump version to fix
 build error
In-Reply-To: <201102120903.17257.minimod@morethan.org>
References: <1297356435-11303-1-git-send-email-bjorn.forsman@gmail.com>
	<201102120607.50136.minimod@morethan.org>
	<1297517462.5409.5.camel@segulix>
	<201102120903.17257.minimod@morethan.org>
Message-ID: <1297692242.29881.27.camel@segulix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 2011-02-12 at 09:03 -0600, Michael S. Zick wrote: 
> On Sat February 12 2011, Sergio Monteiro Basto wrote:
> > On Sat, 2011-02-12 at 06:07 -0600, Michael S. Zick wrote: 
> > > On Fri February 11 2011, Sergio Monteiro Basto wrote:
> > > > 
> > > > On Thu, 2011-02-10 at 21:28 +0100, Peter Korsgaard wrote: 
> > > > > >>>>> "Bj?rn" == Bj?rn Forsman <bjorn.forsman@gmail.com> writes:
> > > > > 
> > > > >  Bj?rn> Bump mplayer to the first version that fixes this issue:
> > > > >  Bj?rn> file.c:23:5: warning: "HAVE_MMAP" is not defined
> > > > >  Bj?rn> file.c:25:7: warning: "HAVE_MAPVIEWOFFILE" is not defined
> > > > >  Bj?rn> file.c:77:5: warning: "HAVE_MMAP" is not defined
> > > > >  Bj?rn> file.c:87:7: warning: "HAVE_MAPVIEWOFFILE" is not defined
> > > > >  Bj?rn> file.c:124:5: warning: "HAVE_MMAP" is not defined
> > > > >  Bj?rn> file.c:126:7: warning: "HAVE_MAPVIEWOFFILE" is not defined
> > > > >  Bj?rn> file.c: In function 'av_file_map':
> > > > >  Bj?rn> file.c:50: error: 'HAVE_MMAP' undeclared (first use in this function)
> > > > >  Bj?rn> file.c:50: error: (Each undeclared identifier is reported only once
> > > > >  Bj?rn> file.c:50: error: for each function it appears in.)
> > > > >  Bj?rn> make[2]: *** [file.o] Error 1
> > > > > 
> > > > > Committed, thanks.
> > > > 
> > > > Hi, 
> > > > mplayer, now, has been compiled successfully on mipsel , without any
> > > > changes. 
> > > >
> > > 
> > > That is good news and I see you have tweaked your howto page.
> > > Haven't had any available "hobby time" myself yet this year.
> > 
> > don't worry :)
> > btw , http://minimodding.com/tiki-index.php?page=UserPagesergiomb is the
> > page.
> > Well one off-topic question , now is my next idea.
> > How or can I upgrade busybox from 1.1.3 to busybox 1.17 without change
> > init scripts ? 
> >
> 
> You might need to apply the Realtek sigabrt patch -
> http://minimodding.com/tiki-download_file.php?fileId=44
> Which cgales did for 1.15 but I suspect it will apply to 1.17 also.

OK CC to buildroot , off-topic but why not ?, someone could help.

but where is described what cgales made for 1.15 ? is what is write on 
http://minimodding.com/CustomFirmware ? 

But anyway leaves to same question, I have a mountpoint with busybox
1.1.3 and want upgrade busybox to 1.17 without change init scripts and
keep box working, after reboot.

Just overwrite busybox1.17 files and just keep what is in /etc ? 
in CustomFirmware page mention a yaffs2_2 stuff example which is should
be saved ? 
dvdplayer  group  hdd  hdd.old  ld.so.conf  magic  passwd  profile  rcS


yeah , if I need to tweak BusyBox with that patch, that is easy (I think). 

Best regards,

-- 
S?rgio M. B.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3309 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110214/9c58bea0/attachment.bin>
