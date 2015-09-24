From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Sep 2015 09:52:24 +0200
Subject: [Buildroot] [git commit] micropython: Bump version to v1.4.6
Message-ID: <20150924075555.B46CF81DD3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=81c4788dedcf5e27eb6d87d1912635e0fad0783c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/micropython/micropython.mk |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 1358864..f5e0ce7 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -4,14 +4,11 @@
 #
 ################################################################################
 
-MICROPYTHON_VERSION = v1.4.5
+MICROPYTHON_VERSION = v1.4.6
 MICROPYTHON_SITE = $(call github,micropython,micropython,$(MICROPYTHON_VERSION))
 MICROPYTHON_LICENSE = MIT
 MICROPYTHON_LICENSE_FILES = LICENSE
 MICROPYTHON_DEPENDENCIES = host-pkgconf libffi
-MICROPYTHON_PATCH = \
-	https://github.com/micropython/micropython/commit/8b4fb4fe140e9cf57fcfa258d0d2d6fe19090fc5.patch \
-	https://github.com/micropython/micropython/commit/587914169cc6ff7f0513bd14c42dcbb275bf77bd.patch
 
 # Use fallback implementation for exception handling on architectures that don't
 # have explicit support.
