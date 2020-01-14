From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jan 2020 23:00:26 +0100
Subject: [Buildroot] [git commit] package/spdlog: bump to version 1.5.0
Message-ID: <20200114215027.453A482189@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d4db8292de4ac686039ee0c4e4b20b9fb6f2eaa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix build with latest fmt (6.1.2)

Fixes:
 - http://autobuild.buildroot.org/results/7e7f698b620c1726cbeb89cc8709b1b609ba0762

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/spdlog/spdlog.hash | 2 +-
 package/spdlog/spdlog.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/spdlog/spdlog.hash b/package/spdlog/spdlog.hash
index 0eb5bee491..2b51877aa2 100644
--- a/package/spdlog/spdlog.hash
+++ b/package/spdlog/spdlog.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 821c85b120ad15d87ca2bc44185fa9091409777c756029125a02f81354072157  spdlog-1.4.2.tar.gz
+sha256 b38e0bbef7faac2b82fed550a0c19b0d4e7f6737d5321d4fd8f216b80f8aee8a  spdlog-1.5.0.tar.gz
 sha256 7d40b1967fca203d22b0eaf75f54566167ded823863abedf4de869fcea057038  LICENSE
diff --git a/package/spdlog/spdlog.mk b/package/spdlog/spdlog.mk
index b878170978..f8eb9bc0f9 100644
--- a/package/spdlog/spdlog.mk
+++ b/package/spdlog/spdlog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPDLOG_VERSION = 1.4.2
+SPDLOG_VERSION = 1.5.0
 SPDLOG_SITE = $(call github,gabime,spdlog,v$(SPDLOG_VERSION))
 SPDLOG_LICENSE = MIT
 SPDLOG_LICENSE_FILES = LICENSE
