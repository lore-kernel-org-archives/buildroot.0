From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jul 2012 19:12:50 +0200
Subject: [Buildroot] [git commit] libnfc: add license information
Message-ID: <20120730171639.8F79996FA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=94d462331c4a21fa874184aa074dd019a9a4e144
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libnfc/libnfc.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libnfc/libnfc.mk b/package/libnfc/libnfc.mk
index ab062bb..08892b3 100644
--- a/package/libnfc/libnfc.mk
+++ b/package/libnfc/libnfc.mk
@@ -6,6 +6,8 @@
 LIBNFC_VERSION = 1446
 LIBNFC_SITE = http://libnfc.googlecode.com/svn/trunk/
 LIBNFC_SITE_METHOD = svn
+LIBNFC_LICENSE = LGPLv3+
+LIBNFC_LICENSE_FILES = COPYING
 LIBNFC_AUTORECONF = YES
 LIBNFC_INSTALL_STAGING = YES
 
