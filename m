From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 6 Jan 2015 09:07:47 +0000
Subject: [Buildroot] [PATCH] automake: bump version to 1.15
Message-ID: <1420535267-45405-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-Bump version to 1.15
-Add a hash file

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/automake/automake.hash |    2 ++
 package/automake/automake.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)
 create mode 100644 package/automake/automake.hash

diff --git a/package/automake/automake.hash b/package/automake/automake.hash
new file mode 100644
index 0000000..83aca90
--- /dev/null
+++ b/package/automake/automake.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  9908c75aabd49d13661d6dcb1bc382252d22cc77bf733a2d55e87f2aa2db8636  automake-1.15.tar.xz
diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index 17bc799..a3fd18c 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOMAKE_VERSION = 1.14.1
+AUTOMAKE_VERSION = 1.15
 AUTOMAKE_SOURCE = automake-$(AUTOMAKE_VERSION).tar.xz
 AUTOMAKE_SITE = $(BR2_GNU_MIRROR)/automake
 AUTOMAKE_LICENSE = GPLv2+
-- 
1.7.1
