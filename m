From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Feb 2018 22:27:40 +0100
Subject: [Buildroot] [git commit] azmq: bump to version 1.0.2
Message-ID: <20180305200719.02F2B81199@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=17a6404faf50f2886f0cace4cd91f921f118430e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add license hash

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/azmq/azmq.hash | 5 +++--
 package/azmq/azmq.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/azmq/azmq.hash b/package/azmq/azmq.hash
index d3993f4988..35139cfaeb 100644
--- a/package/azmq/azmq.hash
+++ b/package/azmq/azmq.hash
@@ -1,3 +1,4 @@
 # Locally calculated
-# https://github.com/zeromq/azmq/archive/v1.0.tar.gz
-sha256 c204c731bcb7810ca3a2c5515e88974ef2ff8d0589e60a897dc238b369180e7b  azmq-v1.0.tar.gz
+# https://github.com/zeromq/azmq/archive/v1.0.2.tar.gz
+sha256 25fa8b07756cffae95e25a55c7ea42efe02e8cd797552201aa771dd69cfc8fbf  azmq-v1.0.2.tar.gz
+sha256 c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE-BOOST_1_0
diff --git a/package/azmq/azmq.mk b/package/azmq/azmq.mk
index 427ad0f5b4..9ccb407a65 100644
--- a/package/azmq/azmq.mk
+++ b/package/azmq/azmq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AZMQ_VERSION = v1.0
+AZMQ_VERSION = v1.0.2
 AZMQ_SITE = $(call github,zeromq,azmq,$(AZMQ_VERSION))
 AZMQ_DEPENDENCIES = boost zeromq
 AZMQ_LICENSE = BSL-1.0
