From: MikeW <mw_phil@yahoo.co.uk>
Date: Wed, 29 Nov 2006 14:58:34 +0000 (UTC)
Subject: [Buildroot]
	=?utf-8?q?=27ld=27_gives_=22unrecognised_emulation_mo?=
	=?utf-8?q?de=22_-_ARM=09toolchain_unbuildable_=3F=3F?=
References: <loom.20061101T111436-827@post.gmane.org>
	<loom.20061102T152239-949@post.gmane.org>
	<loom.20061121T200844-447@post.gmane.org>
	<f2b55d220611211208yef912b8p4c00bfd2ee2a2eca@mail.gmail.com>
	<loom.20061122T095656-727@post.gmane.org>
	<f2b55d220611220908v2a8699bt61a298dbf3fcf100@mail.gmail.com>
Message-ID: <loom.20061129T155533-364@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michael K. Edwards <medwards.linux@...> writes:

> 
> Did I say armelf-linux-eabi?  Silly me.  What's working for me (with
> glibc and crosstool) is armelf-linux-gnueabi.  I'm almost done
> scrubbing cross-configure problems out of my ptxdist userland and will
> start banging on uClibc/buildroot today; I'll let you know what I
> find.
> 
> Cheers,
> - Michael
> 

Even that gets rejected as being 'armelf_linux', not 'armelf_linux_eabi'.

Looks to me as if there's a regexp somewhere picking out the subcomponents
of the string, and it's somehow not getting the final '_eabi' section.

But where ... crosstool ?

Regards,
MikeW
