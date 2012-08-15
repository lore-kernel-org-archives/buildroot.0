From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Aug 2012 12:03:16 +0200
Subject: [Buildroot] [git commit] libdaemon: add license info
Message-ID: <20120815100418.1579C971A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=972c8d134782458d67efedd2479eb4301f1544fb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libdaemon/libdaemon.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libdaemon/libdaemon.mk b/package/libdaemon/libdaemon.mk
index 1bdc1e2..214402a 100644
--- a/package/libdaemon/libdaemon.mk
+++ b/package/libdaemon/libdaemon.mk
@@ -6,6 +6,8 @@
 
 LIBDAEMON_VERSION = 0.14
 LIBDAEMON_SITE = http://0pointer.de/lennart/projects/libdaemon
+LIBDAEMON_LICENSE = LGPLv2.1+
+LIBDAEMON_LICENSE_FILES = LICENSE
 LIBDAEMON_INSTALL_STAGING = YES
 LIBDAEMON_CONF_ENV = ac_cv_func_setpgrp_void=no
 LIBDAEMON_CONF_OPT = --disable-lynx
