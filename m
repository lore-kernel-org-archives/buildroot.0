From: Romain Naour <romain.naour@openwide.fr>
Date: Tue,  5 Nov 2013 23:59:17 +0100
Subject: [Buildroot] [PATCH 1/1] sqlcipher: fix download url
Message-ID: <1383692357-1519-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/sqlcipher/sqlcipher.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index 3ade403..e93d24d 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQLCIPHER_VERSION = v1.1.9
-SQLCIPHER_SITE = http://github.com/sjlombardo/sqlcipher/tarball/$(SQLCIPHER_VERSION)
+SQLCIPHER_SITE = http://github.com/sqlcipher/sqlcipher/archive/$(SQLCIPHER_VERSION)
 SQLCIPHER_DEPENDENCIES = openssl host-tcl
 SQLCIPHER_INSTALL_STAGING = YES
 
-- 
1.8.4
