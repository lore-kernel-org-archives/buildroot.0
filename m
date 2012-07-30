From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jul 2012 19:19:09 +0200
Subject: [Buildroot] [git commit branch/next] libpng: security bump to
	version 1.4.12
Message-ID: <20120802195302.492728E8F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0d27d8cb46b9f0805e90dd09d579cb1dbb7aff7b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes CVE-2012-3386

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libpng/libpng.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index dd295c6..6edabc4 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBPNG_VERSION = 1.4.11
+LIBPNG_VERSION = 1.4.12
 LIBPNG_SERIES = 14
 LIBPNG_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.bz2
