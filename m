From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jul 2012 09:42:05 +0200
Subject: [Buildroot] [git commit branch/next] libfreefare: bump version to
	0.3.4
Message-ID: <20120802195256.9536B8E8F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6d38cf852248764b633750d210f71cac983ec451
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch bumps the libfreefare package from version 0.3.2 to version 0.3.4.

Version 0.3.4 requires a minium libnfc version of 1.6. A separate patch has
been submitted to bump the libnfc version; that patch should be regarded as
a prerequisite for the present patch.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libfreefare/libfreefare.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libfreefare/libfreefare.mk b/package/libfreefare/libfreefare.mk
index 3f0036a..3c96839 100644
--- a/package/libfreefare/libfreefare.mk
+++ b/package/libfreefare/libfreefare.mk
@@ -3,7 +3,7 @@
 # libfreefare
 #
 #############################################################
-LIBFREEFARE_VERSION = 0.3.2
+LIBFREEFARE_VERSION = 0.3.4
 LIBFREEFARE_SITE = http://nfc-tools.googlecode.com/files
 LIBFREEFARE_DEPENDENCIES = libnfc openssl
 
