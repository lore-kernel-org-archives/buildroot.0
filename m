From: MikeW <mw_phil@yahoo.co.uk>
Date: Wed, 8 Nov 2006 14:17:57 +0000 (UTC)
Subject: [Buildroot] Building libstdc++: will Buildroot build uClibc++ ?
References: <loom.20061107T195057-525@post.gmane.org>
Message-ID: <loom.20061108T150727-429@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MikeW <mw_phil@...> writes:

> 
> (Buildroot snapshot 2006-10-31)
> Building gcc-3.4.x for ARM and enabling libstdc++ support I get
the above error.
> 
> It is mentioned in the Mantis system (id 904) but the final note
says it is not a
> uClibc problem, and the issue is closed.
> 
> Presumably the patch should have been included with current versions of
> Buildroot, but it has been omitted ?
> 
> Regards,
> Mike
> 

I note there is a uClibc C++ library, but apparently no Buildroot option
to build it - how should one enable build/use of this library in place of
libstdc++ ?

Thanks,
Mike
