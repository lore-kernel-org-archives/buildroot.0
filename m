From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 16:39:45 +0200
Subject: [Buildroot] [git commit] lzo: bump to version 2.08
Message-ID: <20140629144039.0D4D29D106@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=01012167dffccc8a82f3a0f712a842e217f7b466
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to the LZO website: "LZO 2.08 has been released: small
update that corrects some reported build problems.". And indeed it
fixes the failed compiler conformance tests that have been observed on
the autobuilders.

Fixes:

  http://autobuild.buildroot.org/results/1e8/1e8e826c4463c9dd3aa5ddb95f08b9564d10a75d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lzo/lzo.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lzo/lzo.mk b/package/lzo/lzo.mk
index e9e0b3f..9f0729a 100644
--- a/package/lzo/lzo.mk
+++ b/package/lzo/lzo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LZO_VERSION = 2.07
+LZO_VERSION = 2.08
 LZO_SITE = http://www.oberhumer.com/opensource/lzo/download
 LZO_LICENSE = GPLv2+
 LZO_LICENSE_FILES = COPYING
