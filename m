From: Alex Song <songqf9@yahoo.ca>
Date: Wed, 13 Dec 2006 14:13:45 -0500 (EST)
Subject: [Buildroot] Using external toolchain / disabling Buildroot
	toolchain
In-Reply-To: <loom.20061213T195208-342@post.gmane.org>
Message-ID: <287497.12093.qm@web50006.mail.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I had this situation before since we were forced to
use glibc. I'm not sure of a better, easier or
preferred way but I modified the files and only used
buildroot to build the packages.

Regards,

Alex


--- MikeW <mw_phil@yahoo.co.uk> wrote:

> Buildroot cannot build a required toolchain, but I
> would still like
> to use it to build everything else.
> 
> Is there a preferred way to disable building the
> toolchain, and to set
> Buildroot to use an external toolchain instead ?
> 
> (This is 'inside-out' from the BR docs which say how
> to use the BR toolchain
> from outside.)
> 
> Looking at the top-level Makefile, this looks as if
> it would involve
> edits to the file(s).
> 
> Regards,
> MikeW
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
