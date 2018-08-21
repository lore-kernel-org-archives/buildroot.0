From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Aug 2018 22:35:42 +0200
Subject: [Buildroot] [git commit branch/next] xxhash: bump to version 0.6.5
Message-ID: <20180821203409.B6B118E1E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e0c5439a160a6aa9202f7c924198e894cc01fa71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xxhash/xxhash.hash | 4 +++-
 package/xxhash/xxhash.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/xxhash/xxhash.hash b/package/xxhash/xxhash.hash
index 31081c01d8..8a00a427f8 100644
--- a/package/xxhash/xxhash.hash
+++ b/package/xxhash/xxhash.hash
@@ -1,2 +1,4 @@
 # locally computed
-sha256  9743539ed787ea9bd5bb348265cebdd5adcbf820ad329bf44c28bc69ab4c7cd8  xxhash-r40.tar.gz
+sha256  19030315f4fc1b4b2cdb9d7a317069a109f90e39d1fe4c9159b7aaa39030eb95  xxhash-v0.6.5.tar.gz
+sha256  86ec6953794503942b70fcd4f35b565d44f63f703b7037ce44dad965c4aaae91  LICENSE
+sha256  8e449f232e2cd984e1d286711653960b4a9a555d90b4dc05fe4f0d7a1838fe1b  xxhsum.c
diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
index 7e04066340..9bb259a280 100644
--- a/package/xxhash/xxhash.mk
+++ b/package/xxhash/xxhash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XXHASH_VERSION = r40
+XXHASH_VERSION = v0.6.5
 XXHASH_SITE = $(call github,Cyan4973,xxHash,$(XXHASH_VERSION))
 XXHASH_LICENSE = BSD-2-Clause, GPL-2.0+
 XXHASH_LICENSE_FILES = LICENSE xxhsum.c
