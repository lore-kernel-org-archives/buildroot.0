From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Sep 2016 14:29:38 -0000
Subject: [Buildroot] [git commit] xen: Bump to version 4.7
Message-ID: <20160902142936.1F78F7F886@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00b344cc547c39af150c0196ff1e70785465f17d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump Xen up to 4.7 which is the latest release.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xen/xen.hash | 2 +-
 package/xen/xen.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index c124b3a..602e6c7 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 6fa1c2431df55aa5950d248e6093b8c8c0f11c357a0adbd348a2186478e80909 xen-4.6.0.tar.gz
+sha256 be5876144d49729572ae06142e0bb93f1c1f2695578141eff2931995add24623 xen-4.7.0.tar.gz
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 759667a..eb40454 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XEN_VERSION = 4.6.0
+XEN_VERSION = 4.7.0
 XEN_SITE = http://bits.xensource.com/oss-xen/release/$(XEN_VERSION)
 XEN_LICENSE = GPLv2
 XEN_LICENSE_FILES = COPYING
