From: MikeW <mw_phil@yahoo.co.uk>
Date: Thu, 14 Dec 2006 09:40:53 +0000 (UTC)
Subject: [Buildroot]
	=?utf-8?q?Impossible_to_build_EABI_ARM_gcc_toolchain?=
	=?utf-8?q?=09using=09Buildroot_=3F?=
References: <loom.20061129T130728-811@post.gmane.org>
	<1164848869.23643.60.camel@dv>
Message-ID: <loom.20061214T103502-915@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pavel Roskin <proski@...> writes:

> Maybe you can fix it.  You can try another compiler.

Unfortunately, Buldroot gcc-4.1.1 which includes ARM EABI support won't build
the 2.6.10 kernel we are using - fails in the get_user macro in uaccess.h.

Patch that, something else breaks in a similar way due to the compiler
breaking code that worked under gcc-3.4.x (it needs a switch to turn this off!)

The joys of bazaar development - grrr !

Regards,
MikeW
