From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Dec 2013 22:25:08 +0100
Subject: [Buildroot] [git commit] libcuefile: add licensing info
Message-ID: <20131211213615.571E39BFD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=44de1624e4de46474e9b3ecb640e75af67e71ed3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcuefile/libcuefile.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libcuefile/libcuefile.mk b/package/libcuefile/libcuefile.mk
index ceb1509..d1f2448 100644
--- a/package/libcuefile/libcuefile.mk
+++ b/package/libcuefile/libcuefile.mk
@@ -8,6 +8,8 @@ LIBCUEFILE_VERSION = r475
 LIBCUEFILE_SITE = http://files.musepack.net/source
 LIBCUEFILE_SOURCE = libcuefile_$(LIBCUEFILE_VERSION).tar.gz
 LIBCUEFILE_INSTALL_STAGING = YES
+LIBCUEFILE_LICENSE = GPLv2+
+LIBCUEFILE_LICENSE_FILES = COPYING
 
 define LIBCUEFILE_INSTALL_STAGING_INCLUDES
 	cp -r $(@D)/include $(STAGING_DIR)/usr
