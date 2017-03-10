From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 10 Mar 2017 21:20:44 +0100
Subject: [Buildroot] [PATCH] swupdate: bump to version 2017.01
Message-ID: <20170310202044.11041-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/swupdate/swupdate.hash | 2 +-
 package/swupdate/swupdate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index 1ba10f645..d4e883393 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  840d6287a41f7a42e08a74045ee40b7c2f82c1ecfedf8c915e3935d4f0084376  swupdate-2016.10.tar.gz
+sha256  ce28348e98aa5657154d2eacc2e8a9b114ba50a937531b010872c8eb6fd72b23  swupdate-2017.01.tar.gz
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 688f4eef8..7f2cb0a46 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2016.10
+SWUPDATE_VERSION = 2017.01
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPLv2+, MIT, Public Domain
 SWUPDATE_LICENSE_FILES = COPYING
-- 
2.12.0
