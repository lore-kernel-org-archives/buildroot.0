From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  7 Sep 2015 09:44:20 -0300
Subject: [Buildroot] [PATCH] strongswan: bump to version 5.3.3
Message-ID: <1441629860-13033-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/strongswan/strongswan.hash | 6 ++++--
 package/strongswan/strongswan.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/strongswan/strongswan.hash b/package/strongswan/strongswan.hash
index 8b31de4..5e1cf4d 100644
--- a/package/strongswan/strongswan.hash
+++ b/package/strongswan/strongswan.hash
@@ -1,2 +1,4 @@
-# From http://download.strongswan.org/strongswan-5.3.2.tar.bz2.md5
-md5	fab014be1477ef4ebf9a765e10f8802c	strongswan-5.3.2.tar.bz2
+# From http://download.strongswan.org/strongswan-5.3.3.tar.bz2.md5
+md5	5a25f3d1c31a77ef44d14a2e7b3eaad0	strongswan-5.3.3.tar.bz2
+# Calculated based on the hash above
+sha256	39d2e8f572a57a77dda8dd8bdaf2ee47ad3cefeb86bbb840d594aa75f00f33e2	strongswan-5.3.3.tar.bz2
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 47a28a3..ff4c072 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRONGSWAN_VERSION = 5.3.2
+STRONGSWAN_VERSION = 5.3.3
 STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
 STRONGSWAN_SITE = http://download.strongswan.org
 STRONGSWAN_LICENSE = GPLv2+
-- 
2.4.6
