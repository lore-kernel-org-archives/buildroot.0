From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jul 2016 10:48:08 +0200
Subject: [Buildroot] [git commit] botan: bump to version 1.10.13
Message-ID: <20160712084830.D278C7FF29@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=803d484f9559b630720d0b239ad9652435763bad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/botan/botan.hash | 2 +-
 package/botan/botan.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/botan/botan.hash b/package/botan/botan.hash
index ab8788e..3da5f69 100644
--- a/package/botan/botan.hash
+++ b/package/botan/botan.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	c2cdb47a8b1ac2368de5b9c51a8fab2a72a5641fbc1afd1abe81d5c6e4197420  Botan-1.10.8.tgz
+sha256	23ec973d4b4a4fe04f490d409e08ac5638afe3aa09acd7f520daaff38ba19b90  Botan-1.10.13.tgz
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 6ac3ce7..69c973e 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-BOTAN_VERSION = 1.10.8
+BOTAN_VERSION = 1.10.13
 BOTAN_SOURCE = Botan-$(BOTAN_VERSION).tgz
-BOTAN_SITE = http://files.randombit.net/botan
+BOTAN_SITE = http://botan.randombit.net/releases
 BOTAN_LICENSE = BSD-2c
 BOTAN_LICENSE_FILES = doc/license.txt
 
