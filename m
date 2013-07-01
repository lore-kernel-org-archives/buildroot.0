From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 1 Jul 2013 11:43:31 +0200
Subject: [Buildroot] [git commit] liburcu: define license
Message-ID: <20130701094857.0BA0E99A82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=327748e9e83fc8a5f4101624c96faaf5221f50db
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/liburcu/liburcu.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index 35f09f7..7a32e7f 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -7,6 +7,8 @@
 LIBURCU_VERSION = 0.7.7
 LIBURCU_SITE    = http://lttng.org/files/urcu/
 LIBURCU_SOURCE  = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
+LIBURCU_LICENSE = LGPLv2.1+ for the library; MIT-like license for few source files listed in LICENSE
+LIBURCU_LICENSE_FILES = lgpl-2.1.txt lgpl-relicensing.txt LICENSE
 
 LIBURCU_INSTALL_STAGING = YES
 
