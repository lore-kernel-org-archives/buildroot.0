From: MikeW <mw_phil@yahoo.co.uk>
Date: Tue, 30 Jan 2007 11:03:16 +0000 (UTC)
Subject: [Buildroot] Fakeroot issues
References: <8706461.post@talk.nabble.com>
Message-ID: <loom.20070130T115942-513@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Daniel Laird <danieljlaird@...> writes:

> 
> 
> Hi I am trying to use buildroot to generate me a CPIO archive which is then
> included in my kernel image as a initramfs.
> 
> The problem I am having is that is looks like all has worked, no errors etc.  
> However the devices that are created by makedev are not being created as
> devices but just as files.
> (build_mipsel/root/dev/....)
> 
> I am presuming this is dues to an issue with fakeroot.  As I can run makedev
> as root user with same parameters and it all works fine.  
> 
> It there any easy way to debug what is going on with fakeroot as I cant get
> this to work at the moment.
> 
> I am using Redhat EL4 (Unfortunate Work Choice) in case that might trigger
> anything.
> 
> Cheers
> Dan
> 
Dan,

Started to look at restoring devices before Xmas ...
is this http://www.openembedded.org/user-manual&dpage=fakeroot any use ?
There's a bit about device nodes created by fakeroot not being 'real' ...
(or wait for a reply from someone who's actually *done* this !)

Cheers,
MikeW
