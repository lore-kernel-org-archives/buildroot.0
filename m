From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Sep 2014 23:15:38 +0200
Subject: [Buildroot] [git commit] slang: bump to 2.3.0
Message-ID: <20140922213008.45A0C9D74E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6712213220985896ee10315d8f97857c326b751f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump version and change download location.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/slang/slang.mk |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index 529f4e5..4726ba1 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -4,10 +4,8 @@
 #
 ################################################################################
 
-SLANG_VERSION_MAJOR = 2.2
-SLANG_VERSION = $(SLANG_VERSION_MAJOR).4
-SLANG_SOURCE = slang-$(SLANG_VERSION).tar.bz2
-SLANG_SITE = ftp://ftp.fu-berlin.de/pub/unix/misc/slang/v$(SLANG_VERSION_MAJOR)
+SLANG_VERSION = 2.3.0
+SLANG_SITE = http://www.jedsoft.org/releases/slang/
 SLANG_LICENSE = GPLv2+
 SLANG_LICENSE_FILES = COPYING
 SLANG_INSTALL_STAGING = YES
