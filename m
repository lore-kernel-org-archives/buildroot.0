From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri, 20 Jun 2014 23:41:06 +0200
Subject: [Buildroot] [PATCH 1/1] packages: fix the header package name
Message-ID: <1403300466-24924-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

According to the documentation:

"Header: The file starts with a header. It contains the module name,
preferably in lowercase, enclosed between separators made of 80 hashes."

This patch makes the appropriate changes.


Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/dbus-cpp/dbus-cpp.mk                       |    2 +-
 package/glibc/glibc.mk                             |    2 +-
 package/ktap/ktap.mk                               |    2 +-
 package/libnetfilter_acct/libnetfilter_acct.mk     |    2 +-
 .../libnetfilter_conntrack.mk                      |    2 +-
 .../libnetfilter_cthelper/libnetfilter_cthelper.mk |    2 +-
 .../libnetfilter_cttimeout.mk                      |    2 +-
 package/libnetfilter_log/libnetfilter_log.mk       |    2 +-
 package/libnetfilter_queue/libnetfilter_queue.mk   |    2 +-
 package/procps-ng/procps-ng.mk                     |    2 +-
 package/snmppp/snmppp.mk                           |    2 +-
 package/x11r7/xlib_libFS/xlib_libFS.mk             |    2 +-
 package/x11r7/xlib_libICE/xlib_libICE.mk           |    2 +-
 package/x11r7/xlib_libSM/xlib_libSM.mk             |    2 +-
 package/x11r7/xlib_libX11/xlib_libX11.mk           |    2 +-
 .../x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk |    2 +-
 package/x11r7/xlib_libXau/xlib_libXau.mk           |    2 +-
 package/x11r7/xlib_libXaw/xlib_libXaw.mk           |    2 +-
 .../x11r7/xlib_libXcomposite/xlib_libXcomposite.mk |    2 +-
 package/x11r7/xlib_libXcursor/xlib_libXcursor.mk   |    2 +-
 package/x11r7/xlib_libXdamage/xlib_libXdamage.mk   |    2 +-
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk       |    2 +-
 package/x11r7/xlib_libXext/xlib_libXext.mk         |    2 +-
 package/x11r7/xlib_libXfixes/xlib_libXfixes.mk     |    2 +-
 package/x11r7/xlib_libXfont/xlib_libXfont.mk       |    2 +-
 package/x11r7/xlib_libXft/xlib_libXft.mk           |    2 +-
 package/x11r7/xlib_libXi/xlib_libXi.mk             |    2 +-
 package/x11r7/xlib_libXinerama/xlib_libXinerama.mk |    2 +-
 package/x11r7/xlib_libXmu/xlib_libXmu.mk           |    2 +-
 package/x11r7/xlib_libXpm/xlib_libXpm.mk           |    2 +-
 package/x11r7/xlib_libXrandr/xlib_libXrandr.mk     |    2 +-
 package/x11r7/xlib_libXrender/xlib_libXrender.mk   |    2 +-
 package/x11r7/xlib_libXres/xlib_libXres.mk         |    2 +-
 package/x11r7/xlib_libXt/xlib_libXt.mk             |    2 +-
 package/x11r7/xlib_libXtst/xlib_libXtst.mk         |    2 +-
 package/x11r7/xlib_libXv/xlib_libXv.mk             |    2 +-
 package/x11r7/xlib_libXvMC/xlib_libXvMC.mk         |    2 +-
 package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk |    2 +-
 package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk   |    2 +-
 39 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/package/dbus-cpp/dbus-cpp.mk b/package/dbus-cpp/dbus-cpp.mk
index 4cf6d18..03f9742 100644
--- a/package/dbus-cpp/dbus-cpp.mk
+++ b/package/dbus-cpp/dbus-cpp.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# dbus-c++
+# dbus-cpp
 #
 ################################################################################
 
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index a0077d2..6f5c53f 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# glibc/eglibc
+# (e)glibc
 #
 ################################################################################
 
diff --git a/package/ktap/ktap.mk b/package/ktap/ktap.mk
index 2c73138..0c2652d 100644
--- a/package/ktap/ktap.mk
+++ b/package/ktap/ktap.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# ktap, script-based dynamic tracing tool
+# ktap
 #
 ################################################################################
 
diff --git a/package/libnetfilter_acct/libnetfilter_acct.mk b/package/libnetfilter_acct/libnetfilter_acct.mk
index 615d46e..5adb6e0 100644
--- a/package/libnetfilter_acct/libnetfilter_acct.mk
+++ b/package/libnetfilter_acct/libnetfilter_acct.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# libnetfilter-acct
+# libnetfilter_acct
 #
 ################################################################################
 
diff --git a/package/libnetfilter_conntrack/libnetfilter_conntrack.mk b/package/libnetfilter_conntrack/libnetfilter_conntrack.mk
index fc3462d..df037b9 100644
--- a/package/libnetfilter_conntrack/libnetfilter_conntrack.mk
+++ b/package/libnetfilter_conntrack/libnetfilter_conntrack.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# libnetfilter-conntrack
+# libnetfilter_conntrack
 #
 ################################################################################
 
diff --git a/package/libnetfilter_cthelper/libnetfilter_cthelper.mk b/package/libnetfilter_cthelper/libnetfilter_cthelper.mk
index 2cac8a2..00388a5 100644
--- a/package/libnetfilter_cthelper/libnetfilter_cthelper.mk
+++ b/package/libnetfilter_cthelper/libnetfilter_cthelper.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# libnetfilter-cthelper
+# libnetfilter_cthelper
 #
 ################################################################################
 
diff --git a/package/libnetfilter_cttimeout/libnetfilter_cttimeout.mk b/package/libnetfilter_cttimeout/libnetfilter_cttimeout.mk
index cf55255..d85a8d2 100644
--- a/package/libnetfilter_cttimeout/libnetfilter_cttimeout.mk
+++ b/package/libnetfilter_cttimeout/libnetfilter_cttimeout.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# libnetfilter-cttimeout
+# libnetfilter_cttimeout
 #
 ################################################################################
 
diff --git a/package/libnetfilter_log/libnetfilter_log.mk b/package/libnetfilter_log/libnetfilter_log.mk
index 1c642d2..a448c54 100644
--- a/package/libnetfilter_log/libnetfilter_log.mk
+++ b/package/libnetfilter_log/libnetfilter_log.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# libnetfilter-log
+# libnetfilter_log
 #
 ################################################################################
 
diff --git a/package/libnetfilter_queue/libnetfilter_queue.mk b/package/libnetfilter_queue/libnetfilter_queue.mk
index 59a4458..d788fd1 100644
--- a/package/libnetfilter_queue/libnetfilter_queue.mk
+++ b/package/libnetfilter_queue/libnetfilter_queue.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# libnetfilter-queue
+# libnetfilter_queue
 #
 ################################################################################
 
diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index 9227cc4..7628c21 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# procps
+# procps-ng
 #
 ################################################################################
 
diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
index 57c4962..5391e10 100644
--- a/package/snmppp/snmppp.mk
+++ b/package/snmppp/snmppp.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# snmp++
+# snmppp
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libFS/xlib_libFS.mk b/package/x11r7/xlib_libFS/xlib_libFS.mk
index 19d2800..25d6119 100644
--- a/package/x11r7/xlib_libFS/xlib_libFS.mk
+++ b/package/x11r7/xlib_libFS/xlib_libFS.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libFS
+# xlib_libfs
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libICE/xlib_libICE.mk b/package/x11r7/xlib_libICE/xlib_libICE.mk
index dd6814e..fcb8599 100644
--- a/package/x11r7/xlib_libICE/xlib_libICE.mk
+++ b/package/x11r7/xlib_libICE/xlib_libICE.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libICE
+# xlib_libice
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libSM/xlib_libSM.mk b/package/x11r7/xlib_libSM/xlib_libSM.mk
index 3352679..f770819 100644
--- a/package/x11r7/xlib_libSM/xlib_libSM.mk
+++ b/package/x11r7/xlib_libSM/xlib_libSM.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libSM
+# xlib_libsm
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index f78538f..96ead1f 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libX11
+# xlib_libx11
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
index 2a648c9..5f94268 100644
--- a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
+++ b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXScrnSaver
+# xlib_libxscrnsaver
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXau/xlib_libXau.mk b/package/x11r7/xlib_libXau/xlib_libXau.mk
index 720c62c..321cdec 100644
--- a/package/x11r7/xlib_libXau/xlib_libXau.mk
+++ b/package/x11r7/xlib_libXau/xlib_libXau.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXau
+# xlib_libxau
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXaw/xlib_libXaw.mk b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
index 3bbd181..10a7940 100644
--- a/package/x11r7/xlib_libXaw/xlib_libXaw.mk
+++ b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXaw
+# xlib_libxaw
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
index f0e59cb..970445a 100644
--- a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
+++ b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXcomposite
+# xlib_libxcomposite
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
index 508b5e2..0bc17ff 100644
--- a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
+++ b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXcursor
+# xlib_libxcursor
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk b/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
index 9f982ee..ea6a863 100644
--- a/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
+++ b/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXdamage
+# xlib_libxdamage
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
index 866f10b..73e6b40 100644
--- a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
+++ b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXdmcp
+# xlib_libxdmcp
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXext/xlib_libXext.mk b/package/x11r7/xlib_libXext/xlib_libXext.mk
index ebfa4bc..e201d61 100644
--- a/package/x11r7/xlib_libXext/xlib_libXext.mk
+++ b/package/x11r7/xlib_libXext/xlib_libXext.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXext
+# xlib_libxext
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
index b94cd0f..9a0b350 100644
--- a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
+++ b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXfixes
+# xlib_libxfixes
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXfont/xlib_libXfont.mk b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
index 5f2b1e1..480f624 100644
--- a/package/x11r7/xlib_libXfont/xlib_libXfont.mk
+++ b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXfont
+# xlib_libxfont
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXft/xlib_libXft.mk b/package/x11r7/xlib_libXft/xlib_libXft.mk
index 37f4434..b840a08 100644
--- a/package/x11r7/xlib_libXft/xlib_libXft.mk
+++ b/package/x11r7/xlib_libXft/xlib_libXft.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXft
+# xlib_libxft
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXi/xlib_libXi.mk b/package/x11r7/xlib_libXi/xlib_libXi.mk
index 849ce09..6f66057 100644
--- a/package/x11r7/xlib_libXi/xlib_libXi.mk
+++ b/package/x11r7/xlib_libXi/xlib_libXi.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXi
+# xlib_libxi
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
index 9336a22..4432123 100644
--- a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
+++ b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXinerama
+# xlib_libxinerama
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXmu/xlib_libXmu.mk b/package/x11r7/xlib_libXmu/xlib_libXmu.mk
index 261f871..8b567cf 100644
--- a/package/x11r7/xlib_libXmu/xlib_libXmu.mk
+++ b/package/x11r7/xlib_libXmu/xlib_libXmu.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXmu
+# xlib_libxmu
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.mk b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
index 766724f..6203779 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.mk
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXpm
+# xlib_libxpm
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
index e2e8bd8..c8d2c5c 100644
--- a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
+++ b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXrandr
+# xlib_libxrandr
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXrender/xlib_libXrender.mk b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
index bc30112..d8426fb 100644
--- a/package/x11r7/xlib_libXrender/xlib_libXrender.mk
+++ b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXrender
+# xlib_libxrender
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXres/xlib_libXres.mk b/package/x11r7/xlib_libXres/xlib_libXres.mk
index b75ddd9..ec4a5c1 100644
--- a/package/x11r7/xlib_libXres/xlib_libXres.mk
+++ b/package/x11r7/xlib_libXres/xlib_libXres.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXres
+# xlib_libxres
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXt/xlib_libXt.mk b/package/x11r7/xlib_libXt/xlib_libXt.mk
index edb01c1..260445d 100644
--- a/package/x11r7/xlib_libXt/xlib_libXt.mk
+++ b/package/x11r7/xlib_libXt/xlib_libXt.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXt
+# xlib_libxt
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXtst/xlib_libXtst.mk b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
index ad3caea..3ef0c95 100644
--- a/package/x11r7/xlib_libXtst/xlib_libXtst.mk
+++ b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXtst
+# xlib_libxtst
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXv/xlib_libXv.mk b/package/x11r7/xlib_libXv/xlib_libXv.mk
index 697e75f..bfdcab0 100644
--- a/package/x11r7/xlib_libXv/xlib_libXv.mk
+++ b/package/x11r7/xlib_libXv/xlib_libXv.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXv
+# xlib_libxv
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
index 2be5840..6b6a55a 100644
--- a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
+++ b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXvMC
+# xlib_libxvmc
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
index 6539659..75d5667 100644
--- a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
+++ b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXxf86dga
+# xlib_libxxf86dga
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
index 74a37f9..0c98e6e 100644
--- a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
+++ b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXxf86vm
+# xlib_libxxf86vm
 #
 ################################################################################
 
-- 
1.7.9.5
