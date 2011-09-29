From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Sep 2011 10:40:58 +0200
Subject: [Buildroot] [git commit] libtool: install into staging
Message-ID: <20110929190331.EF1CB8DAC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1b99a279565fb10c59b93c41f30c8bb835d63331
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libtool provides libltdl, so install it into staging to make it usable
by other packages.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libtool/libtool.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index 3306244..d796f9b 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -6,6 +6,7 @@
 LIBTOOL_VERSION = 2.2.10
 LIBTOOL_SOURCE = libtool-$(LIBTOOL_VERSION).tar.gz
 LIBTOOL_SITE = $(BR2_GNU_MIRROR)/libtool
+LIBTOOL_INSTALL_STAGING = YES
 
 HOST_LIBTOOL_LIBTOOL_PATCH = NO
 
