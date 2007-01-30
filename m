From: Daniel Laird <danieljlaird@hotmail.com>
Date: Tue, 30 Jan 2007 01:46:16 -0800 (PST)
Subject: [Buildroot] Fakeroot issues
Message-ID: <8706461.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi I am trying to use buildroot to generate me a CPIO archive which is then
included in my kernel image as a initramfs.

The problem I am having is that is looks like all has worked, no errors etc.  
However the devices that are created by makedev are not being created as
devices but just as files.
(build_mipsel/root/dev/....)

I am presuming this is dues to an issue with fakeroot.  As I can run makedev
as root user with same parameters and it all works fine.  

It there any easy way to debug what is going on with fakeroot as I cant get
this to work at the moment.

I am using Redhat EL4 (Unfortunate Work Choice) in case that might trigger
anything.

Cheers
Dan

-- 
View this message in context: http://www.nabble.com/Fakeroot-issues-tf3141363.html#a8706461
Sent from the BuildRoot mailing list archive at Nabble.com.
