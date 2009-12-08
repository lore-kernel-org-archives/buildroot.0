From: Michael Trimarchi <trimarchimichael@yahoo.it>
Date: Tue, 8 Dec 2009 20:16:21 +0000 (GMT)
Subject: [Buildroot] Foreigh toolchain
Message-ID: <919832.97890.qm@web23508.mail.ird.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi 

--- Ven 25/9/09, Michael Trimarchi <trimarchimichael@yahoo.it> ha scritto:

> Da: Michael Trimarchi <trimarchimichael@yahoo.it>
> Oggetto: Re: [Buildroot] Foreigh toolchain
> A: buildroot at busybox.net, "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> Data: Venerd? 25 settembre 2009, 09:35
> 
> 
> --- Gio 24/9/09, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ha scritto:
> 
> > Da: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Oggetto: Re: [Buildroot] Foreigh toolchain
> > A: buildroot at busybox.net
> > Data: Gioved? 24 settembre 2009, 20:28
> > Le Thu, 24 Sep 2009 16:33:13 +0000
> > (GMT),
> > Michael Trimarchi <trimarchimichael@yahoo.it>
> > a ?crit :
> > 
> > > I have this problem using the foreigh toolchain.
> Can
> > anyone know how
> > > to fix it?
> > 
> > That's a libtool issue, and I haven't yet found the
> proper
> > solution for
> > it. It's probably a matter of recompiling libtool and
> using
> > our own.
> 
> Ok, I will try it and investigate on it.
> 
> Michael

This compile the glib because the rpath of libtool is controlled
by prefixm but I don't know possiby regression. I just test
the package compilation, so at least we know somenthing

> 
> > 
> > Thomas
> > -- 
> > Thomas Petazzoni, Free Electrons
> > Kernel, drivers and embedded Linux development,
> > consulting, training and support.
> > http://free-electrons.com
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
> 
>


      
-------------- next part --------------
A non-text attachment was scrubbed...
Name: glibc_toolchain.patch
Type: application/x-download
Size: 626 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091208/6abbe127/attachment-0001.bin>
