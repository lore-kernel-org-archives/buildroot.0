From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Jan 2016 17:04:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/openswan: bump version to 2.6.46
Message-ID: <1453565050-20297-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/openswan/openswan.hash | 4 ++--
 package/openswan/openswan.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openswan/openswan.hash b/package/openswan/openswan.hash
index ef4e18b..5929f8d 100644
--- a/package/openswan/openswan.hash
+++ b/package/openswan/openswan.hash
@@ -1,2 +1,2 @@
-# Locally calculated after checking pgp signature
-sha256	b657b4a3828fc6e9830aabeabec047a71993daeb9dd2607f321e355bc5a53e1e	openswan-2.6.45.tar.gz
+# Locally calculated
+sha256	c1605c96d3c3cf357cefea7622f3acbc7a02d6a3cebfb76979327b566084a5ea	openswan-2.6.46.tar.gz
diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
index 7fa945f..54bd4b3 100644
--- a/package/openswan/openswan.mk
+++ b/package/openswan/openswan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSWAN_VERSION = 2.6.45
+OPENSWAN_VERSION = 2.6.46
 OPENSWAN_SITE = http://download.openswan.org/openswan
 OPENSWAN_LICENSE = GPLv2+, BSD-3c
 OPENSWAN_LICENSE_FILES = COPYING LICENSE
-- 
2.7.0.rc3
