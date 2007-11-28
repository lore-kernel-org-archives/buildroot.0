From: shaleh at speakeasy.net <shaleh@speakeasy.net>
Date: Wed, 28 Nov 2007 23:28:26 +0000
Subject: [Buildroot] failure to build gtk because of glib-genmarshal being
 built for target not host
Message-ID: <W9231326052255691196292506@webmail2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am trying to build on x86 for x86. As mentioned in the subject, glib2's glib-genmarshal is built againt uclibc which prevents it from running during the build process. This tool is needed only for compilation and not released systems.

Looking at the log, it appears that glib's configure script correctly determined that a cross-compile was happening. Anyone know what went wrong? Or a resource discussing the issues surrounding compilation of glib2, gtk and friends in a cross-compilation environment?
