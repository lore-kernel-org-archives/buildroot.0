From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Jul 2018 09:35:08 +0200
Subject: [Buildroot] [git commit] wavemon: bump to version 0.8.2
Message-ID: <20180720073141.7725289100@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b502b90f040cf9e62015e3dce7f92a6fb56e69b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash for license file.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wavemon/wavemon.hash | 3 ++-
 package/wavemon/wavemon.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/wavemon/wavemon.hash b/package/wavemon/wavemon.hash
index 69bd2b4bf1..99d7382450 100644
--- a/package/wavemon/wavemon.hash
+++ b/package/wavemon/wavemon.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256  c9ea57da4f8161401bcaaca17b37bcdf16ffb88baad2370afed2e15a7f71af73  wavemon-v0.8.1.tar.gz
+sha256  4199e2ad11a036f4289f5ad42a8b0fe518f2b5ff77447f4c366dbcf3f23e91d5  wavemon-v0.8.2.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/wavemon/wavemon.mk b/package/wavemon/wavemon.mk
index e87ab7a368..0639c3450e 100644
--- a/package/wavemon/wavemon.mk
+++ b/package/wavemon/wavemon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAVEMON_VERSION = v0.8.1
+WAVEMON_VERSION = v0.8.2
 WAVEMON_SITE = $(call github,uoaerg,wavemon,$(WAVEMON_VERSION))
 WAVEMON_LICENSE = GPL-3.0+
 WAVEMON_LICENSE_FILES = COPYING
