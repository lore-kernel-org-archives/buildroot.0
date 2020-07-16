From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Jul 2020 09:14:39 +0200
Subject: [Buildroot] [git commit] package/xxhash: bump version to 0.7.4
Message-ID: <20200716071707.55DF9875ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fcb2a4649d99b2ac46660943c9175455f02b282d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change the hash of the license:
- Copyright message changed from 'present' to 2020
- Link to BSD 2-Clause License changed from http to https

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xxhash/xxhash.hash | 4 ++--
 package/xxhash/xxhash.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xxhash/xxhash.hash b/package/xxhash/xxhash.hash
index 097694364b..5598b64955 100644
--- a/package/xxhash/xxhash.hash
+++ b/package/xxhash/xxhash.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  7e93d28e81c3e95ff07674a400001d0cdf23b7842d49b211e5582d00d8e3ac3e  xxhash-0.7.2.tar.gz
-sha256  94df5da58df6c83bcc2fc0c84aaad71a0b0fe94625060d6cac000121dda37730  LICENSE
+sha256  4d9706c9da4fbdf901598f5e3b71db0eddd4ac962e827a73ebf75d66dfd820fe  xxhash-0.7.4.tar.gz
+sha256  9da63520e9293d82c4b1613be5c84058cadb82b02f5972179bad13731d589910  LICENSE
diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
index bd51c9bd1b..6fbda50fbb 100644
--- a/package/xxhash/xxhash.mk
+++ b/package/xxhash/xxhash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XXHASH_VERSION = 0.7.2
+XXHASH_VERSION = 0.7.4
 XXHASH_SITE = $(call github,Cyan4973,xxHash,v$(XXHASH_VERSION))
 XXHASH_LICENSE = BSD-2-Clause (library), GPL-2.0+ (xxhsum)
 XXHASH_LICENSE_FILES = LICENSE
