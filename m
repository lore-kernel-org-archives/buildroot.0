From: Davide Viti <zinosat@tiscali.it>
Date: Thu,  6 Dec 2012 22:33:17 +0100
Subject: [Buildroot] [PATCH - v2] tcllib: new package
Message-ID: <1354829598-16782-1-git-send-email-zinosat@tiscali.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've updated the patch applying	the fixes suggested during the review.
In particular:

 - remove depends on BR2_PACKAGE_TCL from Config.in
 - fix download URL and fetch smaller bz2 upstream tarball
 - remove $(eval $(host-autotools-package))
 - depend on host-tcl
 - invoke "configure" instead of installer.tcl
 - remove TCLLIB_LICENSE (is not BSD-2c). Just specify
   TCLLIB_LICENSE_FILES

thanx in advance for your feedback
regards,

Davide
