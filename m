From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jan 2020 09:55:46 +0100
Subject: [Buildroot] [git commit] package/micropython: bump to version 1.12
Message-ID: <20200119084903.7DD418295D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04b13f3449bc735d19a5ebbcc3be96da73904f3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See full changelog https://github.com/micropython/micropython/releases/tag/v1.12

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/micropython/micropython.hash | 2 +-
 package/micropython/micropython.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/micropython/micropython.hash b/package/micropython/micropython.hash
index 1b77bc6efe..a889044ef3 100644
--- a/package/micropython/micropython.hash
+++ b/package/micropython/micropython.hash
@@ -1,2 +1,2 @@
 #locally computed
-sha256 2ab6f75b4bff040445f848004d387dbe1bcbdf1188db2334b2bd3eaa173eb744  micropython-1.11.tar.gz
+sha256 330cd32c7b67cb6b531d158eabcf68af3a7d7ad7b5a4b0ce3c73da3d241da6a2  micropython-1.12.tar.gz
diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index a5b8218d1f..8328992090 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MICROPYTHON_VERSION = 1.11
+MICROPYTHON_VERSION = 1.12
 MICROPYTHON_SITE = $(call github,micropython,micropython,v$(MICROPYTHON_VERSION))
 MICROPYTHON_LICENSE = MIT
 MICROPYTHON_LICENSE_FILES = LICENSE
