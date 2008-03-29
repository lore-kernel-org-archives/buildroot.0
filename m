From: Nigel Kukard <nkukard@lbsd.net>
Date: Sat, 29 Mar 2008 12:23:50 +0000
Subject: [Buildroot] legacy sources in svn
In-Reply-To: <87a5b0800803290508t3b1bd407n1eb2e2c76c2a803a@mail.gmail.com>
References: <1206738394.3224.82.camel@nigel-x60>
	<87k5jmft4j.fsf@macbook.be.48ers.dk>
	<87a5b0800803290508t3b1bd407n1eb2e2c76c2a803a@mail.gmail.com>
Message-ID: <1206793430.3224.140.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> >
> >  I think people simply forget to remove them when they remove the
> >  Kconfig stuff - I have lately been cleaning up the uClibc patches
> that
> >  weren't used any more.
> >
> >   Nigel> Surely they can get the old patches from svn? I mean, the
> >   Nigel> versions are mostly removed from all Config.in and .mk
> files
> >   Nigel> anyway?
> >
> >  Exactly, feel free to remove them.
> 
> I have some concerns about this. People may want to keep stable
> toolchains to avoid bugs in newer versions or for QA purposes.
> Removing working configurations in the name of "tidying up" sounds
> like a bad idea to me.

The versions I'm referring to aren't even available in the menuconfig,
nor is there any config for them in the makefiles or config.in magic
anymore.


-N
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080329/a67fd1c9/attachment.pgp 
