From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 1 Jul 2013 11:44:36 +0200
Subject: [Buildroot] [git commit] lttng-modules: define license
Message-ID: <20130701094858.3A6D699A82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a4c1447d9016aef76b90a82f59a9cfa841115274
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lttng-modules/lttng-modules.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index a0f6c8f..66faa1f 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -7,6 +7,8 @@
 LTTNG_MODULES_VERSION = 2.2.0
 LTTNG_MODULES_SITE    = http://lttng.org/files/lttng-modules/
 LTTNG_MODULES_SOURCE  = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
+LTTNG_MODULES_LICENSE = LGPLv2.1/GPLv2 for kernel modules; MIT for lib/bitfield.h and lib/prio_heap/*
+LTTNG_MODULES_LICENSE_FILES = lgpl-2.1.txt gpl-2.0.txt mit-license.txt LICENSE
 
 LTTNG_MODULES_DEPENDENCIES = linux
 
