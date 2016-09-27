From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 27 Sep 2016 07:39:48 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/monolite: bump to version 149
Message-ID: <1474954789-14602-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps monolite to version 149

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/monolite/monolite.hash | 2 +-
 package/monolite/monolite.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/monolite/monolite.hash b/package/monolite/monolite.hash
index 44ec39a..621e5e4 100644
--- a/package/monolite/monolite.hash
+++ b/package/monolite/monolite.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 885270da1b64670bffec9c8df1272ab88ff0b96186d2ebb61bdfa47a5586f987  monolite-140-latest.tar.gz
+sha256 c01e9ba37d8d8f9ef68e08170b2582cc710a8a77756e2412dff298a39b3c4d2b  monolite-149-latest.tar.gz
diff --git a/package/monolite/monolite.mk b/package/monolite/monolite.mk
index 91c01d7..d50d9f2 100644
--- a/package/monolite/monolite.mk
+++ b/package/monolite/monolite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONOLITE_VERSION = 140
+MONOLITE_VERSION = 149
 MONOLITE_SITE = http://download.mono-project.com/monolite/
 MONOLITE_SOURCE = monolite-$(MONOLITE_VERSION)-latest.tar.gz
 MONOLITE_LICENSE = LGPLv2 or commercial
-- 
1.9.1
