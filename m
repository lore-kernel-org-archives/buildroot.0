From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 23 Feb 2015 09:06:39 -0300
Subject: [Buildroot] [PATCH] samba4: security bump to version 4.1.17
Message-ID: <1424693199-18642-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2015-0240 - Unexpected code execution in smbd.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/samba4/samba4.hash | 2 +-
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index bff18a8..721c3dc 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	12a09c167bfa25f50b82775bcbeda94c71c5d71d3b0d1210f6dae0f23020a87b	samba-4.1.16.tar.gz
+sha256	7aeb5d09e9c84bbeeb4b98d33404e9dbc4d99c54e64a447cc9c4d57e9255cb1d	samba-4.1.17.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 4239b42..bd8ed12 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.1.16
+SAMBA4_VERSION = 4.1.17
 SAMBA4_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_LICENSE = GPLv3+
-- 
2.0.5
