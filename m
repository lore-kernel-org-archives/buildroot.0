From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 22 Jul 2016 20:34:19 -0300
Subject: [Buildroot] [PATCH] iozone: bump to version 3_446
Message-ID: <1469230459-22824-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iozone/iozone.hash | 2 +-
 package/iozone/iozone.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iozone/iozone.hash b/package/iozone/iozone.hash
index 8d05382..b387588 100644
--- a/package/iozone/iozone.hash
+++ b/package/iozone/iozone.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	e8388238326dc29359e5cb9f790d193f1e1bdadfbf260e010c50fa682387faed	iozone3_430.tar
+sha256	bbbda98d7c052d8654ea23fb2187d831107ab4ac89842fa21509276d9a6915f0	iozone3_446.tar
diff --git a/package/iozone/iozone.mk b/package/iozone/iozone.mk
index 0662207..e2f8557 100644
--- a/package/iozone/iozone.mk
+++ b/package/iozone/iozone.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IOZONE_VERSION = 3_430
+IOZONE_VERSION = 3_446
 IOZONE_SOURCE = iozone$(IOZONE_VERSION).tar
 IOZONE_SITE = http://www.iozone.org/src/current
 IOZONE_LICENSE = IOzone license (NO DERIVED WORKS ALLOWED)
-- 
2.7.3
