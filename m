From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 24 Nov 2015 23:51:53 +0100
Subject: [Buildroot] [PATCH 2/2] package/monolite: bump to version 138
In-Reply-To: <1448405513-20741-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1448405513-20741-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1448405513-20741-3-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bump to version 138 needed for mono 4.2.1.102

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/monolite/monolite.hash | 2 +-
 package/monolite/monolite.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/monolite/monolite.hash b/package/monolite/monolite.hash
index 1139c0a..fa098e2 100644
--- a/package/monolite/monolite.hash
+++ b/package/monolite/monolite.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 07a8573feef0053ec28b98355feba8c83dcfb3f99c2d0913a16a287382daf4b8  monolite-117-latest.tar.gz
+sha256 0cf7aeafb22daeb7ed3398057f0ac88015440901f480ef84cba2431a753f8c1e  monolite-138-latest.tar.gz
diff --git a/package/monolite/monolite.mk b/package/monolite/monolite.mk
index aa6c28c..3c53bff 100644
--- a/package/monolite/monolite.mk
+++ b/package/monolite/monolite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONOLITE_VERSION = 117
+MONOLITE_VERSION = 138
 MONOLITE_SITE = http://storage.bos.xamarin.com/mono-dist-master/latest
 MONOLITE_SOURCE = monolite-$(MONOLITE_VERSION)-latest.tar.gz
 MONOLITE_LICENSE = LGPLv2 or commercial
-- 
1.9.1
