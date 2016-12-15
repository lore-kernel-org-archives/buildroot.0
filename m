From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Dec 2016 13:55:12 +0100
Subject: [Buildroot] [git commit] tinyalsa: bump version to 1.1.0
Message-ID: <20161215125823.8F71581E41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a911bf8d14e919711a61e1c16772c12841800569
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tinyalsa/tinyalsa.hash | 2 +-
 package/tinyalsa/tinyalsa.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tinyalsa/tinyalsa.hash b/package/tinyalsa/tinyalsa.hash
index e07b419..b6bea47 100644
--- a/package/tinyalsa/tinyalsa.hash
+++ b/package/tinyalsa/tinyalsa.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256  b3f22f762cca8edc692d239a9793a66b11aa5447dcee009e53987f5850f405e3  tinyalsa-v1.0.2.tar.gz
+sha256  93f4ca1e6345974167dc5577e8151a31fa2e6a628727a72d59e18db2289e7a1c  tinyalsa-1.1.0.tar.gz
diff --git a/package/tinyalsa/tinyalsa.mk b/package/tinyalsa/tinyalsa.mk
index 87753d6..0edb0bc 100644
--- a/package/tinyalsa/tinyalsa.mk
+++ b/package/tinyalsa/tinyalsa.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINYALSA_VERSION = v1.0.2
+TINYALSA_VERSION = 1.1.0
 TINYALSA_SITE = $(call github,tinyalsa,tinyalsa,$(TINYALSA_VERSION))
 TINYALSA_LICENSE = BSD-3c
 TINYALSA_INSTALL_STAGING = YES
