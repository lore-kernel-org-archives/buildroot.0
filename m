From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 14 Jan 2020 18:59:13 +0100
Subject: [Buildroot] [PATCH 2/2] package/spdlog: bump to version 1.5.0
In-Reply-To: <20200114175913.1589808-1-fontaine.fabrice@gmail.com>
References: <20200114175913.1589808-1-fontaine.fabrice@gmail.com>
Message-ID: <20200114175913.1589808-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix build with latest fmt (6.1.2)

Fixes:
 - http://autobuild.buildroot.org/results/7e7f698b620c1726cbeb89cc8709b1b609ba0762

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.24.1
