From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 11 Sep 2015 14:12:38 +0100
Subject: [Buildroot] [PATCH] samba4: bump version to 4.3.0
Message-ID: <1441977158-2546-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/samba4/samba4.hash |    2 +-
 package/samba4/samba4.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index e2b3969..5544ee7 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	b6dfa5ae4818d891ee2fcff04a5912f4a4fb2394b4f5e66a2a15b428da094c7c	samba-4.2.3.tar.gz
+sha256 d8dbb6b29dec1d9aa295655c4aa4eadd1e5367ef7047be22f4d6a18ba8acdb63  samba-4.3.0.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index c88cc9f..71623f5 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.2.3
+SAMBA4_VERSION = 4.3.0
 SAMBA4_SITE = http://ftp.samba.org/pub/samba
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
1.7.1
