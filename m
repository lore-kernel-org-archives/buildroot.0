From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Apr 2015 15:22:15 +0200
Subject: [Buildroot] [git commit] webp: bump to version 0.4.3
Message-ID: <20150403132221.CB865819BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=37c3449fd901def4a52ee50e432e7dcffd4c885c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/webp/webp.hash |    2 ++
 package/webp/webp.mk   |    4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/webp/webp.hash b/package/webp/webp.hash
new file mode 100644
index 0000000..328f263
--- /dev/null
+++ b/package/webp/webp.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	efbe0d58fda936f2ed99d0b837ed7087d064d6838931f282c4618d2a3f7390c4	libwebp-0.4.3.tar.gz
diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index 1fece6d..5f2cab7 100644
--- a/package/webp/webp.mk
+++ b/package/webp/webp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-WEBP_VERSION = 0.3.1
+WEBP_VERSION = 0.4.3
 WEBP_SOURCE = libwebp-$(WEBP_VERSION).tar.gz
-WEBP_SITE = https://webp.googlecode.com/files
+WEBP_SITE = http://downloads.webmproject.org/releases/webp
 WEBP_LICENSE = BSD-3c
 WEBP_LICENSE_FILES = COPYING
 WEBP_INSTALL_STAGING = YES
