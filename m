From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Oct 2019 09:32:00 +0200
Subject: [Buildroot] [git commit] package/libseccomp: bump to version 2.4.1
Message-ID: <20191018072708.4E798825A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5787d1ab149a3092a6cb580eeabc96d12f6a8bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a BPF generation bug where the optimizer mistakenly identified
duplicate BPF code blocks.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libseccomp/libseccomp.hash | 2 +-
 package/libseccomp/libseccomp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libseccomp/libseccomp.hash b/package/libseccomp/libseccomp.hash
index c4ed713880..39c5f8aa38 100644
--- a/package/libseccomp/libseccomp.hash
+++ b/package/libseccomp/libseccomp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 b7ee0299157fb7a6a81c99f2e0d7e64429b7d7c0eae43c3a6ef91e87eeed2868 libseccomp-2.4.0.tar.gz
+sha256 36aa502c0461ae9efc6c93ec2430d6badd9bf91ecbe73806baf7b7c6f687ab4f libseccomp-2.4.1.tar.gz
 sha256 102900208eef27b766380135906d431dba87edaa7ec6aa72e6ebd3dd67f3a97b LICENSE
diff --git a/package/libseccomp/libseccomp.mk b/package/libseccomp/libseccomp.mk
index 4480375f5b..491e51b375 100644
--- a/package/libseccomp/libseccomp.mk
+++ b/package/libseccomp/libseccomp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSECCOMP_VERSION = 2.4.0
+LIBSECCOMP_VERSION = 2.4.1
 LIBSECCOMP_SITE = $(call github,seccomp,libseccomp,v$(LIBSECCOMP_VERSION))
 LIBSECCOMP_LICENSE = LGPL-2.1
 LIBSECCOMP_LICENSE_FILES = LICENSE
