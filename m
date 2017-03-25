From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Mar 2017 14:34:57 +0100
Subject: [Buildroot] [git commit] package/enlightenment: bump to version
	0.21.7
Message-ID: <20170325133503.C524F802AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=12dd82e8522fa81c117e2d3923da103f312d6352
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/enlightenment/enlightenment.hash | 4 ++--
 package/enlightenment/enlightenment.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/enlightenment/enlightenment.hash b/package/enlightenment/enlightenment.hash
index 777ee2d..e69c7ff 100644
--- a/package/enlightenment/enlightenment.hash
+++ b/package/enlightenment/enlightenment.hash
@@ -1,2 +1,2 @@
-# From https://www.enlightenment.org/news/e-0.21.6-release
-sha256	ed0714b54d692cbcec412bdb169e5360355347ce775d27d6ae0cee25111b563d 	enlightenment-0.21.6.tar.xz
+# From https://www.enlightenment.org/news/e-0.21.7-release
+sha256	7643f7fd4aadaca44c886f21063987624c50d4c50266e87600e902a59b7c76f7 	enlightenment-0.21.7.tar.xz
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index 6529287..0899890 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ENLIGHTENMENT_VERSION = 0.21.6
+ENLIGHTENMENT_VERSION = 0.21.7
 ENLIGHTENMENT_SOURCE = enlightenment-$(ENLIGHTENMENT_VERSION).tar.xz
 ENLIGHTENMENT_SITE = http://download.enlightenment.org/rel/apps/enlightenment
 ENLIGHTENMENT_LICENSE = BSD-2c
