From: MikeW <mw_phil@yahoo.co.uk>
Date: Fri, 26 Jan 2007 18:28:56 +0000 (UTC)
Subject: [Buildroot] Using external toolchain / disabling Buildroot
	toolchain
References: <loom.20061213T195208-342@post.gmane.org>
Message-ID: <loom.20070126T192656-570@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MikeW <mw_phil@...> writes:

> 
> Buildroot cannot build a required toolchain, but I would still like
> to use it to build everything else.
> 
> Is there a preferred way to disable building the toolchain, and to set
> Buildroot to use an external toolchain instead ?
> 
> (This is 'inside-out' from the BR docs which say how to use the BR toolchain
> from outside.)
> 
> Looking at the top-level Makefile, this looks as if it would involve
> edits to the file(s).
> 
> Regards,
> MikeW
> 

Looks like there's a possible patch here
http://bugs.uclibc.org/view.php?id=237

Don't you wish there was a 'patch gallery' ?!

MikeW
