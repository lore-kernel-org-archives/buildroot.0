From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 10:24:02 +0200
Subject: [Buildroot] [git commit] xorriso: remove empty host dependencies
	definition
Message-ID: <20160703082409.0CEA57FE9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc5f44d98b376bf9f742fff67e41bf8168cda2e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While there, fix some typos.

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xorriso/xorriso.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/xorriso/xorriso.mk b/package/xorriso/xorriso.mk
index 396eeae..be19322 100644
--- a/package/xorriso/xorriso.mk
+++ b/package/xorriso/xorriso.mk
@@ -8,9 +8,8 @@ XORRISO_VERSION = 1.4.2
 XORRISO_SITE = $(BR2_GNU_MIRROR)/xorriso
 XORRISO_LICENSE = GPLv3+
 XORRISO_LICENSE_FILES = COPYING COPYRIGHT
-HOST_XORRISO_DEPENDENCIES =
-# Disable everything until we actually need those feature, and add the correct
-# host-libraries
+# Disable everything until we actually need those features, and add the correct
+# host libraries
 HOST_XORRISO_CONF_OPTS = \
 	--disable-zlib \
 	--disable-bzip2 \
