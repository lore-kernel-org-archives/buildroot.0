From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sun, 12 Jun 2016 13:59:59 +0200
Subject: [Buildroot] [PATCH 2/2] package/monolite: bump to version 140
In-Reply-To: <1465732799-7929-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1465732799-7929-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1465732799-7929-3-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps monolite to version 140

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/monolite/monolite.hash | 2 +-
 package/monolite/monolite.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/monolite/monolite.hash b/package/monolite/monolite.hash
index fa098e2..44ec39a 100644
--- a/package/monolite/monolite.hash
+++ b/package/monolite/monolite.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 0cf7aeafb22daeb7ed3398057f0ac88015440901f480ef84cba2431a753f8c1e  monolite-138-latest.tar.gz
+sha256 885270da1b64670bffec9c8df1272ab88ff0b96186d2ebb61bdfa47a5586f987  monolite-140-latest.tar.gz
diff --git a/package/monolite/monolite.mk b/package/monolite/monolite.mk
index 761e776..91c01d7 100644
--- a/package/monolite/monolite.mk
+++ b/package/monolite/monolite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONOLITE_VERSION = 138
+MONOLITE_VERSION = 140
 MONOLITE_SITE = http://download.mono-project.com/monolite/
 MONOLITE_SOURCE = monolite-$(MONOLITE_VERSION)-latest.tar.gz
 MONOLITE_LICENSE = LGPLv2 or commercial
-- 
1.9.1
