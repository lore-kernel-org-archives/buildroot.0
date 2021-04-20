From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Apr 2021 22:18:54 +0200
Subject: [Buildroot] [git commit] package/exfatprogs: bump to version 1.1.0
Message-ID: <20210420195218.8604D83D46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e55af2ff9efc0104abb10fcd542351cd782de8db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/exfatprogs/exfatprogs/releases/tag/1.1.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/exfatprogs/exfatprogs.hash | 6 ++++--
 package/exfatprogs/exfatprogs.mk   | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/exfatprogs/exfatprogs.hash b/package/exfatprogs/exfatprogs.hash
index d251bce5e6..4dc18cd4b6 100644
--- a/package/exfatprogs/exfatprogs.hash
+++ b/package/exfatprogs/exfatprogs.hash
@@ -1,3 +1,5 @@
-# Locally calculated
-sha256  982883f208a694962dff0654f4421a1a726d7d71068a0c84b93a10688179a186  exfatprogs-1.0.4.tar.gz
+# From https://github.com/exfatprogs/exfatprogs/releases/download/1.1.0/exfatprogs-1.1.0.tar.xz.sha256
+sha256  69e2cf6430fc1d083c6ae0aea5eb80bf1b8e9775ed833bcd8331aef0fcacaf85  exfatprogs-1.1.0.tar.xz
+
+# Hash for license file
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/exfatprogs/exfatprogs.mk b/package/exfatprogs/exfatprogs.mk
index 56db82cd8a..e10acc9e5f 100644
--- a/package/exfatprogs/exfatprogs.mk
+++ b/package/exfatprogs/exfatprogs.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-EXFATPROGS_VERSION = 1.0.4
+EXFATPROGS_VERSION = 1.1.0
+EXFATPROGS_SOURCE = exfatprogs-$(EXFATPROGS_VERSION).tar.xz
 EXFATPROGS_SITE = https://github.com/exfatprogs/exfatprogs/releases/download/$(EXFATPROGS_VERSION)
 EXFATPROGS_LICENSE = GPL-2.0+
 EXFATPROGS_LICENSE_FILES = COPYING
