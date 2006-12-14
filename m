From: MikeW <mw_phil@yahoo.co.uk>
Date: Thu, 14 Dec 2006 09:29:52 +0000 (UTC)
Subject: [Buildroot] Using external toolchain / toolchain as package
References: <loom.20061213T195208-342@post.gmane.org>
Message-ID: <loom.20061214T102900-433@post.gmane.org>
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

On a related subject, it might be useful if a toolchain could be installed
from a (special) package - this would allow prebuilt toolchains, or other
source packages (the one I'm looking at is the ARM EABI one from CodeSourcery).

Maybe it's all in there now, and I just need to look ;-)

Regards,
MikeW
