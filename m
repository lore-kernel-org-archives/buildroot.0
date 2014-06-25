From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jun 2014 23:01:23 +0200
Subject: [Buildroot] [git commit] libv4l: add license information
Message-ID: <20140625211214.0DB899D0C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=23c422c34325733bed064efd4ae7ba0bb88dde8d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix typo + add libv4l1 clarification file as suggested by Yann]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libv4l/libv4l.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index f62a4b6..684f0ec 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -10,6 +10,8 @@ LIBV4L_SITE = http://linuxtv.org/downloads/v4l-utils/
 LIBV4L_INSTALL_STAGING = YES
 LIBV4L_MAKE_OPTS = PREFIX=/usr
 LIBV4L_DEPENDENCIES = jpeg
+LIBV4L_LICENSE = GPLv2+ (utilities), LGPLv2.1+ (libraries)
+LIBV4L_LICENSE_FILES = COPYING COPYING.LIB lib/libv4l1/libv4l1-kernelcode-license.txt
 
 LIBV4L_DIRS_y += lib
 LIBV4L_DIRS_$(BR2_PACKAGE_LIBV4L_DECODE_TM6000)	+= utils/libv4l2util utils/decode_tm6000
