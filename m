From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 25 Nov 2015 19:05:15 -0300
Subject: [Buildroot] [PATCH] dropbear: bump to version 2015.69
Message-ID: <1448489115-13887-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes a port-forwarding regression in 2015.68

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dropbear/dropbear.hash | 2 +-
 package/dropbear/dropbear.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index 981bb1d..1727ed9 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -1,2 +1,2 @@
 # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
-sha256	55ea7c1e904ffe4b1cdbe1addca8291a2533d7d285fd22ac33608e9502a62446  dropbear-2015.68.tar.bz2
+sha256	5d4f5362fc102a0d7cdf1c8cd908c3c4c5cf5c8772936ed639774a08e27517c9  dropbear-2015.69.tar.bz2
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 57c1b5c..d2c194c 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2015.68
+DROPBEAR_VERSION = 2015.69
 DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_LICENSE = MIT, BSD-2c-like, BSD-2c
-- 
2.4.10
