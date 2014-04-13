From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Apr 2014 20:05:33 +0200
Subject: [Buildroot] Version 3.2.0  of the Buildroot Eclipse plugin
Message-ID: <20140413200533.0ced21d2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

M?lanie Bats has just released version 3.2.0 of the Buildroot Eclipse
plugin. This version is compatible with the Eclipse Kepler SR2 version.
It also fixes a debugging problem reported by Oded Hanson: now Eclipse
tells gdb where the sysroot is so that it correctly finds the dynamic
linker.

See:

  https://github.com/mbats/eclipse-buildroot-bundle/wiki

for details about this plugin, its usage and installation process. The
new update site for this plugin version is:

  http://buildroot.org/downloads/eclipse/kepler-sr2/

We remain highly interested in receiving feedback from the users of
this plugin, in order to define what should be the next developments
and improvements.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
