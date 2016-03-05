From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 15:04:10 +0100
Subject: [Buildroot] [git commit] libmatroska: update version
Message-ID: <20160305140419.41A7B7FA00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6fbd0905afd3d17648366828ad55bfb114aef51a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to latest version.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libmatroska/libmatroska.hash | 2 +-
 package/libmatroska/libmatroska.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmatroska/libmatroska.hash b/package/libmatroska/libmatroska.hash
index 4d9a535..275af63 100644
--- a/package/libmatroska/libmatroska.hash
+++ b/package/libmatroska/libmatroska.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	bea10320f1f1fd121bbd7db9ffc77b2518e8269f00903549c5425478bbf8393f	libmatroska-1.4.2.tar.bz2
+sha256	d3efaa9f6d3964351a05bea0f848a8d5dc570e4791f179816ce9a93730296bd7	libmatroska-1.4.4.tar.bz2
diff --git a/package/libmatroska/libmatroska.mk b/package/libmatroska/libmatroska.mk
index 5e2d9b1..083cced 100644
--- a/package/libmatroska/libmatroska.mk
+++ b/package/libmatroska/libmatroska.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMATROSKA_VERSION = 1.4.2
+LIBMATROSKA_VERSION = 1.4.4
 LIBMATROSKA_SOURCE = libmatroska-$(LIBMATROSKA_VERSION).tar.bz2
 LIBMATROSKA_SITE = http://dl.matroska.org/downloads/libmatroska
 LIBMATROSKA_INSTALL_STAGING = YES
