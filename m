From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Jul 2016 11:48:47 +0200
Subject: [Buildroot] [git commit] musl: bump to version 1.1.15
Message-ID: <20160707094913.204EC80450@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=57fc25e8b2164adddf4c77a3632e2e9d2d7f31ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/musl/musl.hash | 2 +-
 package/musl/musl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/musl/musl.hash b/package/musl/musl.hash
index 907e9c6..8ef4def 100644
--- a/package/musl/musl.hash
+++ b/package/musl/musl.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	35f6c00c84a6091bd5dab29eedde7508dae755ead92dcc0239f3677d1055b9b5  musl-1.1.14.tar.gz
+sha256	97e447c7ee2a7f613186ec54a93054fe15469fe34d7d323080f7ef38f5ecb0fa  musl-1.1.15.tar.gz
diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 733f940..920bbbf 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUSL_VERSION = 1.1.14
+MUSL_VERSION = 1.1.15
 MUSL_SITE = http://www.musl-libc.org/releases
 MUSL_LICENSE = MIT
 MUSL_LICENSE_FILES = COPYRIGHT
