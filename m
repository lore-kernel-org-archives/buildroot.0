From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 20 Oct 2015 10:27:36 -0300
Subject: [Buildroot] [PATCH] samba4: bump to version 4.3.1
Message-ID: <1445347656-11423-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/samba4/samba4.hash | 2 +-
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index d242f94..48860a7 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	d8dbb6b29dec1d9aa295655c4aa4eadd1e5367ef7047be22f4d6a18ba8acdb63	samba-4.3.0.tar.gz
+sha256	9908a80d95b9e2583906ed4347a8c80b769539a2788158992fb48ea9fb4d2c82	samba-4.3.1.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 6f3fb58..1d02e86 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.3.0
+SAMBA4_VERSION = 4.3.1
 SAMBA4_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.4.10
