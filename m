From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Dec 2013 14:02:09 -0300
Subject: [Buildroot] [PATCH] gdbm: bump to version 1.11 and fix license
Message-ID: <1388077329-22460-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gdbm/gdbm.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gdbm/gdbm.mk b/package/gdbm/gdbm.mk
index 60b46c7..12e1dac 100644
--- a/package/gdbm/gdbm.mk
+++ b/package/gdbm/gdbm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-GDBM_VERSION = 1.10
+GDBM_VERSION = 1.11
 GDBM_SITE = $(BR2_GNU_MIRROR)/gdbm
-GDBM_LICENSE = GPLv3
+GDBM_LICENSE = GPLv3+
 GDBM_LICENSE_FILES = COPYING
 GDBM_INSTALL_STAGING = YES
 
-- 
1.8.3.2
