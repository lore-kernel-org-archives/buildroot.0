From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Nov 2015 16:29:55 +0100
Subject: [Buildroot] [git commit] dropbear: bump version to 2015.70
Message-ID: <20151126153110.1DAAB81E61@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1069d0fc8cbdca7cb04d1d4ff0c58b46e23299b1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bugfix release, fixes password auth support detection.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dropbear/dropbear.hash |    2 +-
 package/dropbear/dropbear.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index 1727ed9..4b2d99a 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -1,2 +1,2 @@
 # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
-sha256	5d4f5362fc102a0d7cdf1c8cd908c3c4c5cf5c8772936ed639774a08e27517c9  dropbear-2015.69.tar.bz2
+sha256	62a8cc3df1d0f136d46f50d4f8d92f7ab7ce1addac76b25446b3f6aaf80bf257  dropbear-2015.70.tar.bz2
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index d2c194c..f32a60d 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2015.69
+DROPBEAR_VERSION = 2015.70
 DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_LICENSE = MIT, BSD-2c-like, BSD-2c
