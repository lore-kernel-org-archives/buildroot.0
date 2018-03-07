From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 Mar 2018 22:48:39 +0100
Subject: [Buildroot] [git commit] libusbgx: bump to v0.2.0
Message-ID: <20180307215356.5ACBA82680@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3ced4d018c1f533240977420b43898a1cef9e7be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The GitHub tag is really "libusbgx-0.2.0" so we end up with a slightly
strange looking version and archive name, but this is correct given the
tag.

Signed-off-by: John Keeping <john@metanate.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libusbgx/libusbgx.hash | 2 +-
 package/libusbgx/libusbgx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libusbgx/libusbgx.hash b/package/libusbgx/libusbgx.hash
index c185c5803c..c153acaf4a 100644
--- a/package/libusbgx/libusbgx.hash
+++ b/package/libusbgx/libusbgx.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  1e258205dcde99d0eeb52404ee7ff1bc9a39eb3878e8455fb72bad7cf90c7357  libusbgx-2e3d43ee098ed928d1baa61ce791ce9ff4788c5a.tar.gz
+sha256  b15abc89a0ef82c6a650cc1d58b5ba50f7ce076db392add84caabcd86c608ee2  libusbgx-libusbgx-v0.2.0.tar.gz
diff --git a/package/libusbgx/libusbgx.mk b/package/libusbgx/libusbgx.mk
index 1964b47d02..e7c082f9f3 100644
--- a/package/libusbgx/libusbgx.mk
+++ b/package/libusbgx/libusbgx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUSBGX_VERSION = 2e3d43ee098ed928d1baa61ce791ce9ff4788c5a
+LIBUSBGX_VERSION = libusbgx-v0.2.0
 LIBUSBGX_SITE = $(call github,libusbgx,libusbgx,$(LIBUSBGX_VERSION))
 LIBUSBGX_LICENSE = GPL-2.0+ (examples), LGPL-2.1+ (library)
 LIBUSBGX_LICENSE_FILES = COPYING COPYING.LGPL
