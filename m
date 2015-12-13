From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 14:30:26 +0100
Subject: [Buildroot] [git commit] package/clamav: Fix LICENSE_FILES after
	last version bump
Message-ID: <20151213133032.3BF8081794@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=beb67930c621b7b474c37631b02830c2b93dab74
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/3a1/3a12aea6a7a3500883a6d0184da3bd8cebf50e7b/
and many others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/clamav/clamav.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 75d88bc..35afd1e 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -8,7 +8,7 @@ CLAMAV_VERSION = 0.99
 CLAMAV_SITE = http://sourceforge.net/projects/clamav/files/clamav/$(CLAMAV_VERSION)
 CLAMAV_LICENSE = GPLv2
 CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
-	COPYING.LGPL COPYING.llvm COPYING.lzma COPYING.regex COPYING.sha256 \
+	COPYING.LGPL COPYING.llvm COPYING.lzma COPYING.pcre COPYING.regex \
 	COPYING.unrar COPYING.zlib
 CLAMAV_DEPENDENCIES = \
 	host-pkgconf \
