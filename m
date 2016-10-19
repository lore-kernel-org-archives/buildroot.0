From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Oct 2016 11:20:52 +0200
Subject: [Buildroot] [git commit] package/efl: bump to 1.18.2
Message-ID: <20161019093219.9965B819A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6358949de973441697e481b6cd5ce0cd3df05aac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/efl/efl.hash | 4 ++--
 package/efl/efl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/efl/efl.hash b/package/efl/efl.hash
index 37354fb..18393a4 100644
--- a/package/efl/efl.hash
+++ b/package/efl/efl.hash
@@ -1,2 +1,2 @@
-# From https://download.enlightenment.org/rel/libs/efl/efl-1.18.1.tar.xz.sha256
-sha256	0c6bd150d8e838f849effd462d91d86255e3aaade47a6077d0aa80d2b8e9d222	efl-1.18.1.tar.xz
+# From https://download.enlightenment.org/rel/libs/efl/efl-1.18.2.tar.xz.sha256
+sha256	292faf76557fe56a6bc15b48b5ea3eb1f0790e2ed7f2ade4ae79ef7973d67bed	efl-1.18.2.tar.xz
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 949da2d..777ef3c 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFL_VERSION = 1.18.1
+EFL_VERSION = 1.18.2
 EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
 EFL_SITE = http://download.enlightenment.org/rel/libs/efl
 EFL_LICENSE = BSD-2c, LGPLv2.1+, GPLv2+
