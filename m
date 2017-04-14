From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Apr 2017 13:13:27 +0200
Subject: [Buildroot] [git commit] package/nodejs: bump version to 7.9.0
Message-ID: <20170414111331.AF4B782213@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aeb74a35616e1de22568c70e875d1e518497927f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See https://nodejs.org/en/blog/release/v7.9.0/

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index c5e7d14..e54b5e3 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,2 +1,2 @@
-# From upstream URL: http://nodejs.org/dist/v7.8.0/SHASUMS256.txt
-sha256  6821aaee58bbc8bc8d08fec6989a42278b725a21382500dc20fd9d9f71398f02  node-v7.8.0.tar.xz
+# From upstream URL: http://nodejs.org/dist/v7.9.0/SHASUMS256.txt
+sha256  a569764b884929f31a0772600a5cf36048ad42aa8c54ba4cabea6c067ef96a29  node-v7.9.0.tar.xz
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 24672ed..1a19502 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 7.8.0
+NODEJS_VERSION = 7.9.0
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs zlib \
