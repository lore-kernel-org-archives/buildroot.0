From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  8 Jun 2015 10:50:06 -0300
Subject: [Buildroot] [PATCH] strongswan: security bump to version 5.3.2
Message-ID: <1433771406-17543-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

CVE-2015-4171 - rogue servers with a valid certificate
accepted by the client to trick it into disclosing its username and even
password (if the client accepts EAP-GTC).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/strongswan/strongswan.hash | 4 ++--
 package/strongswan/strongswan.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/strongswan/strongswan.hash b/package/strongswan/strongswan.hash
index e38c736..8b31de4 100644
--- a/package/strongswan/strongswan.hash
+++ b/package/strongswan/strongswan.hash
@@ -1,2 +1,2 @@
-# From http://download.strongswan.org/strongswan-5.3.1.tar.bz2.md5
-md5	66f258901a3d6c271da1a0c7fb3e5013	strongswan-5.3.1.tar.bz2
+# From http://download.strongswan.org/strongswan-5.3.2.tar.bz2.md5
+md5	fab014be1477ef4ebf9a765e10f8802c	strongswan-5.3.2.tar.bz2
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index f165eb1..47a28a3 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRONGSWAN_VERSION = 5.3.1
+STRONGSWAN_VERSION = 5.3.2
 STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
 STRONGSWAN_SITE = http://download.strongswan.org
 STRONGSWAN_LICENSE = GPLv2+
-- 
2.3.6
