From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Thu, 29 Nov 2007 12:49:32 +0200
Subject: [Buildroot] failure to build gtk because of glib-genmarshal
 being built for target not host
In-Reply-To: <W9231326052255691196292506@webmail2>
References: <W9231326052255691196292506@webmail2>
Message-ID: <474E993C.7000502@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

shaleh at speakeasy.net wrote:
> I am trying to build on x86 for x86. As mentioned in the subject, glib2's glib-genmarshal is built againt uclibc which prevents it from running during the build process. This tool is needed only for compilation and not released systems.
> 
> Looking at the log, it appears that glib's configure script correctly determined that a cross-compile was happening. Anyone know what went wrong? Or a resource discussing the issues surrounding compilation of glib2, gtk and friends in a cross-compilation environment?

See http://busybox.net/bugs/view.php?id=1408

Regards,
Ivan

-- 

--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
