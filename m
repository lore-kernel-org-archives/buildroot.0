From: MikeW <mw_phil@yahoo.co.uk>
Date: Fri, 1 Dec 2006 10:28:03 +0000 (UTC)
Subject: [Buildroot]
	=?utf-8?q?Impossible_to_build_EABI_ARM_gcc_toolchain?=
	=?utf-8?q?=09using=09Buildroot_=3F?=
References: <loom.20061129T130728-811@post.gmane.org>
	<1164848869.23643.60.camel@dv>
	<loom.20061130T112254-849@post.gmane.org>
	<1164960699.4870.67.camel@dv>
	<loom.20061201T110658-119@post.gmane.org>
Message-ID: <loom.20061201T111848-976@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MikeW <mw_phil@...> writes:

> Since other people are building ARM EABI versions of gcc, there must
> be a patch that they are using which somehow has been omitted
> from Buildroot :(
> 
> Regards,
> Mike
> 

Incidentally, why don't projects using gcc just inherit all their
patches from gcc ... it seems (from searching) as if each dependent
project has to reinvent its own patches each time, whereas once a fix is found,
it should just go to gcc for everyone to use once & for all, thereby saving
everyone a lot of time and effort.

This should be part of the 'synergy' of open source ...
;-)

Regards,
MikeW
