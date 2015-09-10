From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Sep 2015 14:06:51 +0200
Subject: [Buildroot] [git commit] directfb-examples: bump to 1.7.0
Message-ID: <20150910122137.2EA1D807B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6cac59f8a360dc333828d5f37977d6fcd478f9b8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit bumps the directfb-examples package to use the upstream
1.7.0 version.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/directfb-examples/directfb-examples.hash |    4 ++--
 package/directfb-examples/directfb-examples.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/directfb-examples/directfb-examples.hash b/package/directfb-examples/directfb-examples.hash
index c647fca..9d59cfe 100644
--- a/package/directfb-examples/directfb-examples.hash
+++ b/package/directfb-examples/directfb-examples.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256	b08293697c211b690856f76a25ad7acd4ca458b4132851e0a1e471d0bf23c821	DirectFB-examples-1.6.0.tar.gz
+# Locally computed
+sha256 9a2104cc4da8123c8371813551b66b943198979f745cbebc034bb5e10844122a DirectFB-examples-1.7.0.tar.gz
diff --git a/package/directfb-examples/directfb-examples.mk b/package/directfb-examples/directfb-examples.mk
index ac8e61c..ee883f7 100644
--- a/package/directfb-examples/directfb-examples.mk
+++ b/package/directfb-examples/directfb-examples.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DIRECTFB_EXAMPLES_VERSION = 1.6.0
+DIRECTFB_EXAMPLES_VERSION = 1.7.0
 DIRECTFB_EXAMPLES_SITE = http://www.directfb.org/downloads/Extras
 DIRECTFB_EXAMPLES_SOURCE = DirectFB-examples-$(DIRECTFB_EXAMPLES_VERSION).tar.gz
 DIRECTFB_EXAMPLES_LICENSE = MIT
