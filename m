From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jan 2020 21:09:36 +0100
Subject: [Buildroot] [git commit] package/prosody: bump to version 0.11.4
Message-ID: <20200121200043.D9FA883647@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af3fd3a0d4cc77739cb8b24fd72203820a76df67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/prosody/prosody.hash | 8 ++++----
 package/prosody/prosody.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/prosody/prosody.hash b/package/prosody/prosody.hash
index d7d1d06eda..e39fafde69 100644
--- a/package/prosody/prosody.hash
+++ b/package/prosody/prosody.hash
@@ -1,8 +1,8 @@
 # Locally computed:
-md5    2cf85cd8f7fc061916d97a169e850a0e  prosody-0.11.3.tar.gz
-sha1   87ec8039bf297ba9bc4da44b2ba42f4b035e73ca  prosody-0.11.3.tar.gz
-sha256 cfdabd6f42a9fc5db300221967c518c26bd4b6e62def721c1626894d6325bf87  prosody-0.11.3.tar.gz
-sha512 07239433c7c65184ca24d665c92b787ff9e4a5ee190ab90dede802ffd2cbd97855356d818858871e62284e9923f485b3468ab1baed5d3fb13aac0551a38967eb  prosody-0.11.3.tar.gz
+md5    375a3737ffd6831d967fb1917f097372  prosody-0.11.4.tar.gz
+sha1   59e9e684230c26daf53526e18b0e6e2efb0d63c5  prosody-0.11.4.tar.gz
+sha256 b5f26fa343c7f32f6242721d6991cb35f5d2a28d2bf59d2bc329a940523704fd  prosody-0.11.4.tar.gz
+sha512 0c3aa3373c53f803b88a87dad4ca18b215de7a485d29b0bc4b186d97f7c48262840199a74f62aba6b7b4f1766fdfb37327ed4ff24e877c3a6dfca58764a035c3  prosody-0.11.4.tar.gz
 
 # Hash for license file:
 sha256 bbbdc1c5426e5944cf869fc0faeaf19d88a220cd2b39ea98b7b8e86b0e88a2ef  COPYING
diff --git a/package/prosody/prosody.mk b/package/prosody/prosody.mk
index 05ea3d2e40..7245afdc6c 100644
--- a/package/prosody/prosody.mk
+++ b/package/prosody/prosody.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROSODY_VERSION = 0.11.3
+PROSODY_VERSION = 0.11.4
 PROSODY_SITE = https://prosody.im/downloads/source
 PROSODY_LICENSE = MIT
 PROSODY_LICENSE_FILES = COPYING
