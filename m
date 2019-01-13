From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 13 Jan 2019 13:37:47 +0100
Subject: [Buildroot] [PATCH 3/7] iozone: bump to version 3_483
In-Reply-To: <1547383071-11783-1-git-send-email-gilles.talis@gmail.com>
References: <1547383071-11783-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <1547383071-11783-4-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/iozone/iozone.hash | 2 +-
 package/iozone/iozone.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iozone/iozone.hash b/package/iozone/iozone.hash
index 8f552ba..2a02731 100644
--- a/package/iozone/iozone.hash
+++ b/package/iozone/iozone.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	2733feb63c96f77177c68f3d938f2294d5394d8554b2767c45cbe138b2f3ae30	iozone3_482.tar
+sha256	eeaf16cfbee095b16e4934180c6c7438539629489ce42ef4ace48feb23916b12	iozone3_483.tar
diff --git a/package/iozone/iozone.mk b/package/iozone/iozone.mk
index 05b3973..903d2a1 100644
--- a/package/iozone/iozone.mk
+++ b/package/iozone/iozone.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IOZONE_VERSION = 3_482
+IOZONE_VERSION = 3_483
 IOZONE_SOURCE = iozone$(IOZONE_VERSION).tar
 IOZONE_SITE = http://www.iozone.org/src/current
 IOZONE_LICENSE = IOzone license (NO DERIVED WORKS ALLOWED)
-- 
2.7.4
