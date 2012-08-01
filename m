From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Aug 2012 20:10:48 +0200
Subject: [Buildroot] [git commit] minicom: add license information
Message-ID: <20120801183818.0129E96F7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=df6ef452e7fafc604d8b11c1ccb68279d41bb7cd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/minicom/minicom.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index 7293f6a..6d0607f 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -6,6 +6,8 @@
 MINICOM_VERSION = 2.6.1
 MINICOM_SOURCE = minicom-$(MINICOM_VERSION).tar.gz
 MINICOM_SITE = http://alioth.debian.org/frs/download.php/3700/
+MINICOM_LICENSE = GPLv2+
+MINICOM_LICENSE_FILES = COPYING
 
 # pkg-config is only used to check for liblockdev, which we don't have
 # in BR, so instead of adding host-pkg-config as a dependency, simply
