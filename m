From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 23:40:13 +0100
Subject: [Buildroot] [git commit] package/libplatform: bump version, add hash
Message-ID: <20160302202800.1431880203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=89a8178ba5d502b4b049adf87935d26770db99ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libplatform/libplatform.hash | 2 ++
 package/libplatform/libplatform.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libplatform/libplatform.hash b/package/libplatform/libplatform.hash
new file mode 100644
index 0000000..8975dfd
--- /dev/null
+++ b/package/libplatform/libplatform.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  3603ead8b16a48cb35b1e6dea330a693f10552b1a6ea036c5db9ec248cd8baf5  libplatform-feafe68e3e0b02c3261aefb3d711863ef6fadd38.tar.gz
diff --git a/package/libplatform/libplatform.mk b/package/libplatform/libplatform.mk
index 4eb934f..6d54915 100644
--- a/package/libplatform/libplatform.mk
+++ b/package/libplatform/libplatform.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPLATFORM_VERSION = 1.0.10
+LIBPLATFORM_VERSION = feafe68e3e0b02c3261aefb3d711863ef6fadd38
 LIBPLATFORM_SITE = $(call github,Pulse-Eight,platform,$(LIBPLATFORM_VERSION))
 LIBPLATFORM_LICENSE = GPLv2+, PHP license v3.01
 LIBPLATFORM_LICENSE_FILES = src/os.h src/util/fstrcmp.c
