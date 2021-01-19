From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Jan 2021 20:36:46 +0100
Subject: [Buildroot] [git commit] package/rhash: bump to version 1.4.1
Message-ID: <20210119191808.A0B4288369@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d767cc8484da3e71e8a3d81726613651cafaafd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/rhash/RHash/releases/tag/v1.4.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rhash/rhash.hash | 6 +++---
 package/rhash/rhash.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/rhash/rhash.hash b/package/rhash/rhash.hash
index 29df4daa12..ba7bbb8ab7 100644
--- a/package/rhash/rhash.hash
+++ b/package/rhash/rhash.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/rhash/files/rhash/1.4.0/
-sha1  3db1e87a31c77ca2fa5507db7932ef92e9eb5148  rhash-1.4.0-src.tar.gz
+# From https://sourceforge.net/projects/rhash/files/rhash/1.4.1/
+sha1  e1f559d060fd07bfca854c8ae3384798bd2ef266  rhash-1.4.1-src.tar.gz
 # Locally calculated
-sha256  2ea39540f5c580da0e655f7b483c19e0d31506aed4202d88e8459fa7aeeb8861  rhash-1.4.0-src.tar.gz
+sha256  430c812733e69b78f07ce30a05db69563450e41e217ae618507a4ce2e144a297  rhash-1.4.1-src.tar.gz
 sha256  953e55838353335148c90b5a38a4894292680b1d4c37228ffddddbf18ce54bf5  COPYING
diff --git a/package/rhash/rhash.mk b/package/rhash/rhash.mk
index 55fb08ecea..1682676dac 100644
--- a/package/rhash/rhash.mk
+++ b/package/rhash/rhash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RHASH_VERSION = 1.4.0
+RHASH_VERSION = 1.4.1
 RHASH_SOURCE = rhash-$(RHASH_VERSION)-src.tar.gz
 RHASH_SITE = https://sourceforge.net/projects/rhash/files/rhash/$(RHASH_VERSION)
 RHASH_LICENSE = 0BSD
