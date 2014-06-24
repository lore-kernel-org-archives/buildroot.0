From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue, 24 Jun 2014 09:34:20 +0200
Subject: [Buildroot] [PATCH v2 1/1] packages: fix the header package name
Message-ID: <1403595261-29410-1-git-send-email-jerzy.grzegorek@trzebnica.net>
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
Changes v1 -> v2:
  - remove from taking into account:   (ThomasP)
    glibc.mk
    package/x11r7/*

 package/dbus-cpp/dbus-cpp.mk                       |    2 +-
 package/ktap/ktap.mk                               |    2 +-
 package/libnetfilter_acct/libnetfilter_acct.mk     |    2 +-
 .../libnetfilter_conntrack.mk                      |    2 +-
 .../libnetfilter_cthelper/libnetfilter_cthelper.mk |    2 +-
 .../libnetfilter_cttimeout.mk                      |    2 +-
 package/libnetfilter_log/libnetfilter_log.mk       |    2 +-
 package/libnetfilter_queue/libnetfilter_queue.mk   |    2 +-
 package/procps-ng/procps-ng.mk                     |    2 +-
 package/snmppp/snmppp.mk                           |    2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

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
 
-- 
1.7.9.5
