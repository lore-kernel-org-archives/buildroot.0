From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 Mar 2018 09:39:34 +0100
Subject: [Buildroot] [git commit] package/enlightenment: bump to 0.22.2
Message-ID: <20180317085654.3BCC283698@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=13796a1c0a0734683e66815db055b664c368ec30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See https://www.enlightenment.org/news/e0.22.2_release

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/enlightenment/enlightenment.hash | 4 ++--
 package/enlightenment/enlightenment.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/enlightenment/enlightenment.hash b/package/enlightenment/enlightenment.hash
index 10e8facf35..686d0ef3be 100644
--- a/package/enlightenment/enlightenment.hash
+++ b/package/enlightenment/enlightenment.hash
@@ -1,3 +1,3 @@
-# From https://www.enlightenment.org/news/e0.22.1_release
-sha256	207b6b88dafc4932ab007a835510823c5a1dd8c191876ac037628176ca77a7e0	enlightenment-0.22.1.tar.xz
+# From https://www.enlightenment.org/news/e0.22.2_release
+sha256	4d581ef85246f0cba003427bb9b3758e3de137babea1cdd2affd70a2cbe1632c	enlightenment-0.22.2.tar.xz
 sha256	34dbd501ec9d1c8dcc569c01db9cf9a4b7ee5981614cc9f8f613a97463d27350	COPYING
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index 0d87119bb3..6ee983db76 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ENLIGHTENMENT_VERSION = 0.22.1
+ENLIGHTENMENT_VERSION = 0.22.2
 ENLIGHTENMENT_SOURCE = enlightenment-$(ENLIGHTENMENT_VERSION).tar.xz
 ENLIGHTENMENT_SITE = http://download.enlightenment.org/rel/apps/enlightenment
 ENLIGHTENMENT_LICENSE = BSD-2-Clause
