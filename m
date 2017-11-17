From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Nov 2017 21:47:54 +0100
Subject: [Buildroot] [git commit] libogg: bump to version 1.3.3
Message-ID: <20171201205331.B176D7FBCD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f9891309b70b06a17ec04c0f0ae031ccbc1a4b0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libogg/libogg.hash | 2 +-
 package/libogg/libogg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libogg/libogg.hash b/package/libogg/libogg.hash
index 393ebee..0c65b8e 100644
--- a/package/libogg/libogg.hash
+++ b/package/libogg/libogg.hash
@@ -1,2 +1,2 @@
 # From: http://www.xiph.org/downloads/
-sha256 3f687ccdd5ac8b52d76328fbbfebc70c459a40ea891dbf3dccb74a210826e79b libogg-1.3.2.tar.xz
+sha256 4f3fc6178a533d392064f14776b23c397ed4b9f48f5de297aba73b643f955c08 libogg-1.3.3.tar.xz
diff --git a/package/libogg/libogg.mk b/package/libogg/libogg.mk
index 28b55a8..4c97e9a 100644
--- a/package/libogg/libogg.mk
+++ b/package/libogg/libogg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOGG_VERSION = 1.3.2
+LIBOGG_VERSION = 1.3.3
 LIBOGG_SOURCE = libogg-$(LIBOGG_VERSION).tar.xz
 LIBOGG_SITE = http://downloads.xiph.org/releases/ogg
 LIBOGG_LICENSE = BSD-3-Clause
