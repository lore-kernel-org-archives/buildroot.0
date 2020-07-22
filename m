From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 13:37:23 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/a10disp: add
 license file
Message-ID: <20200722114339.B190C880BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f62754d36e4f5fcbba1195be5ab69b8b2aa26395
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Also separate the fields in the hash file by two spaces.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7ebfb17eaf65eef316916379d6a6e00f8a8cf4fd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/a10disp/a10disp.hash | 3 ++-
 package/a10disp/a10disp.mk   | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/a10disp/a10disp.hash b/package/a10disp/a10disp.hash
index f1bddec5df..acaafc3530 100644
--- a/package/a10disp/a10disp.hash
+++ b/package/a10disp/a10disp.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 5077405030e8f97a1edd4b86d469466abbc4d32b4a4609e58459347fcd1ba35b a10disp-0.6.1.tar.gz
+sha256  5077405030e8f97a1edd4b86d469466abbc4d32b4a4609e58459347fcd1ba35b  a10disp-0.6.1.tar.gz
+sha256  ddf849966f57fee8f9675f5a3c7791353d1cba71695cd58016212fc236bbdbee  a10disp.c
diff --git a/package/a10disp/a10disp.mk b/package/a10disp/a10disp.mk
index 4c2ee14e29..c919202329 100644
--- a/package/a10disp/a10disp.mk
+++ b/package/a10disp/a10disp.mk
@@ -7,6 +7,7 @@
 A10DISP_VERSION = 0.6.1
 A10DISP_SITE = $(call github,hglm,a10disp,v$(A10DISP_VERSION))
 A10DISP_LICENSE = MIT
+A10DISP_LICENSE_FILES = a10disp.c
 
 A10DISP_DEPENDENCIES = linux
 
