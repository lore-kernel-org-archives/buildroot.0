From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Oct 2013 13:32:05 +0200
Subject: [Buildroot] [git commit] libcue: add license info
Message-ID: <20131014113216.D97539B9C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=548185a7b302aedb386fe67e7f22ca78c813dd6f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcue/libcue.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libcue/libcue.mk b/package/libcue/libcue.mk
index cd19f4a..e2cf630 100644
--- a/package/libcue/libcue.mk
+++ b/package/libcue/libcue.mk
@@ -7,6 +7,8 @@
 LIBCUE_VERSION = 1.4.0
 LIBCUE_SITE = http://downloads.sourceforge.net/project/libcue/libcue/$(LIBCUE_VERSION)
 LIBCUE_SOURCE = libcue-$(LIBCUE_VERSION).tar.bz2
+LIBCUE_LICENSE = GPLv2, BSD-2c (rem.c)
+LIBCUE_LICENSE_FILES = COPYING
 LIBCUE_DEPENDENCIES = flex
 LIBCUE_INSTALL_STAGING = YES
 
