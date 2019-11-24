From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Nov 2019 22:53:48 +0100
Subject: [Buildroot] [git commit branch/next] package/terminology: bump to
 version 1.6.0
Message-ID: <20191124214634.B3CF18FBF5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e5bae220ed6747b1a49420fc9efd60e49dacbe9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

See:
https://www.enlightenment.org/news/2019-11-16-terminology-1.6.0

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/terminology/terminology.hash | 4 ++--
 package/terminology/terminology.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/terminology/terminology.hash b/package/terminology/terminology.hash
index 64e7cd9aa2..ed386fb7b3 100644
--- a/package/terminology/terminology.hash
+++ b/package/terminology/terminology.hash
@@ -1,3 +1,3 @@
-# From https://download.enlightenment.org/rel/apps/terminology/terminology-1.5.0.tar.xz.sha256sum
-sha256  de55e503b382bb7c42a7def04c5ef7bff01e3e1fb0b379a4591544899eab8a6c  terminology-1.5.0.tar.xz
+# From https://download.enlightenment.org/rel/apps/terminology/terminology-1.6.0.tar.xz.sha256sum
+sha256  b95cb05653afe0dad77fc038a8d5276c02a9c08d64ac97ddf0cee8087d27bd77  terminology-1.6.0.tar.xz
 sha256  a907d434f4691990ed8f2826ff7546672e9934a26c798351da12ed544dadc628  COPYING
diff --git a/package/terminology/terminology.mk b/package/terminology/terminology.mk
index 590413e69c..add80825a7 100644
--- a/package/terminology/terminology.mk
+++ b/package/terminology/terminology.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TERMINOLOGY_VERSION = 1.5.0
+TERMINOLOGY_VERSION = 1.6.0
 TERMINOLOGY_SOURCE = terminology-$(TERMINOLOGY_VERSION).tar.xz
 TERMINOLOGY_SITE = https://download.enlightenment.org/rel/apps/terminology
 TERMINOLOGY_LICENSE = BSD-2-Clause
