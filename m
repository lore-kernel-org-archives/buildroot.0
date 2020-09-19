From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 19 Sep 2020 18:21:08 +0200
Subject: [Buildroot] [PATCH] package/prosody: bump to version 0.11.6
Message-ID: <20200919162108.664829-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/prosody/prosody.hash | 8 ++++----
 package/prosody/prosody.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/prosody/prosody.hash b/package/prosody/prosody.hash
index e158f5de4..868b781f9 100644
--- a/package/prosody/prosody.hash
+++ b/package/prosody/prosody.hash
@@ -1,8 +1,8 @@
 # Locally computed:
-md5    224b9b49bd1a568a9548590ade253dd6  prosody-0.11.5.tar.gz
-sha1   fbe27d3203671a6ecd5ba8233dc4c113fd76cd2e  prosody-0.11.5.tar.gz
-sha256 55f8bd65d5d2af61cc739bd6164e4207011e0d2d260cde583071c90d8d85408b  prosody-0.11.5.tar.gz
-sha512 43a9facee8d61b69e277e7e8a9091fbfa60be71d6141195dff991f6020c8afadacce26f356b869cb2d7edd9be285e9ce1bcd822f9628cc845d91757e818a0dff  prosody-0.11.5.tar.gz
+md5  e49a0cff05b307f9010bffafdec60b6d  prosody-0.11.6.tar.gz
+sha1  3c24f3faf7735c570213da74eba6343c3afdf50d  prosody-0.11.6.tar.gz
+sha256  cda1db631c5f91f8439c66c9204dbf3bc41efd65313f7f5d3c88121ff9141755  prosody-0.11.6.tar.gz
+sha512  4ba048f686d3780ed9a58d81bbb791bec85d6c1caf60793fa85f9921c5352d74ccfc70b3c8db57a16edd8ad8f05cfc26e1403e4e2d0fa53a0d2ecc238dd2781d  prosody-0.11.6.tar.gz
 
 # Hash for license file:
 sha256 bbbdc1c5426e5944cf869fc0faeaf19d88a220cd2b39ea98b7b8e86b0e88a2ef  COPYING
diff --git a/package/prosody/prosody.mk b/package/prosody/prosody.mk
index 7348ddabe..2bf4f3e79 100644
--- a/package/prosody/prosody.mk
+++ b/package/prosody/prosody.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROSODY_VERSION = 0.11.5
+PROSODY_VERSION = 0.11.6
 PROSODY_SITE = https://prosody.im/downloads/source
 PROSODY_LICENSE = MIT
 PROSODY_LICENSE_FILES = COPYING
-- 
2.25.1
