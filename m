From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Dec 2015 21:30:18 +0100
Subject: [Buildroot] [git commit] fakeroot: bump to version 1.20.2
Message-ID: <20151202203304.6AEEB80AE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b2d6ea2bb2cbb573b8fa7eb2c0d881ecbf7ad6f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fakeroot/fakeroot.hash | 6 ++++--
 package/fakeroot/fakeroot.mk   | 4 ++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/fakeroot/fakeroot.hash b/package/fakeroot/fakeroot.hash
index c9e1f0c..f0d436e 100644
--- a/package/fakeroot/fakeroot.hash
+++ b/package/fakeroot/fakeroot.hash
@@ -1,2 +1,4 @@
-# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/f/fakeroot/fakeroot_1.18.4-2.debian.tar.gz
-sha256	0a359efa3e9496c33234b3e9c89306a09bb4da9d33de43c261f1d8447e6ebea2	fakeroot_1.18.4.orig.tar.bz2
+# From http://snapshot.debian.org/package/fakeroot/1.20.2-1/
+sha1	367040df07043edb630942b21939e493f3fad888	fakeroot_1.20.2.orig.tar.bz2
+# Calculated based on the hash above
+sha256	7c0a164d19db3efa9e802e0fc7cdfeff70ec6d26cdbdc4338c9c2823c5ea230c	fakeroot_1.20.2.orig.tar.bz2
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 3f1c803..8bb9294 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-FAKEROOT_VERSION = 1.18.4
+FAKEROOT_VERSION = 1.20.2
 FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.bz2
-FAKEROOT_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/f/fakeroot
+FAKEROOT_SITE = http://snapshot.debian.org/archive/debian/20141005T221953Z/pool/main/f/fakeroot
 FAKEROOT_LICENSE = GPLv3+
 FAKEROOT_LICENSE_FILES = COPYING
 
