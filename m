From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 16 Apr 2020 08:29:07 +0200
Subject: [Buildroot] [PATCH] package/prosody: bump to version 0.11.5
Message-ID: <20200416062907.23461-1-francois.perrad@gadz.org>
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
index e39fafde6..e158f5de4 100644
--- a/package/prosody/prosody.hash
+++ b/package/prosody/prosody.hash
@@ -1,8 +1,8 @@
 # Locally computed:
-md5    375a3737ffd6831d967fb1917f097372  prosody-0.11.4.tar.gz
-sha1   59e9e684230c26daf53526e18b0e6e2efb0d63c5  prosody-0.11.4.tar.gz
-sha256 b5f26fa343c7f32f6242721d6991cb35f5d2a28d2bf59d2bc329a940523704fd  prosody-0.11.4.tar.gz
-sha512 0c3aa3373c53f803b88a87dad4ca18b215de7a485d29b0bc4b186d97f7c48262840199a74f62aba6b7b4f1766fdfb37327ed4ff24e877c3a6dfca58764a035c3  prosody-0.11.4.tar.gz
+md5    224b9b49bd1a568a9548590ade253dd6  prosody-0.11.5.tar.gz
+sha1   fbe27d3203671a6ecd5ba8233dc4c113fd76cd2e  prosody-0.11.5.tar.gz
+sha256 55f8bd65d5d2af61cc739bd6164e4207011e0d2d260cde583071c90d8d85408b  prosody-0.11.5.tar.gz
+sha512 43a9facee8d61b69e277e7e8a9091fbfa60be71d6141195dff991f6020c8afadacce26f356b869cb2d7edd9be285e9ce1bcd822f9628cc845d91757e818a0dff  prosody-0.11.5.tar.gz
 
 # Hash for license file:
 sha256 bbbdc1c5426e5944cf869fc0faeaf19d88a220cd2b39ea98b7b8e86b0e88a2ef  COPYING
diff --git a/package/prosody/prosody.mk b/package/prosody/prosody.mk
index 7245afdc6..7348ddabe 100644
--- a/package/prosody/prosody.mk
+++ b/package/prosody/prosody.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROSODY_VERSION = 0.11.4
+PROSODY_VERSION = 0.11.5
 PROSODY_SITE = https://prosody.im/downloads/source
 PROSODY_LICENSE = MIT
 PROSODY_LICENSE_FILES = COPYING
-- 
2.20.1
