From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 13 Jul 2017 22:03:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/samba4: security bump to version
	4.5.12
Message-ID: <20170713200348.12476-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2017-11103:
https://www.samba.org/samba/history/samba-4.5.12.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/samba4/samba4.hash | 2 +-
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index a16d83470..0783b37d0 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 7cb753f5f6d5527ef40d4c1f47dacafb7c876cb304b4906ccb390c6a18477714  samba-4.5.10.tar.gz
+sha256 f4c17123e3cc852a5ecc7e38884b00deab57632b9519aebc243e2a94b9b5ace4  samba-4.5.12.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 86546e975..72fbd7448 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.5.10
+SAMBA4_VERSION = 4.5.12
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.11.0
