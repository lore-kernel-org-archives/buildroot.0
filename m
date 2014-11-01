From: Karoly Kasza <kaszak@gmail.com>
Date: Sat,  1 Nov 2014 18:33:05 +0100
Subject: [Buildroot] [PATCH v2] xinetd: change download location
Message-ID: <1414863185-1250-1-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xinetd.org is down, change to github instead.
Hash can not be used, the tarball is generated.

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
 package/xinetd/xinetd.mk |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/xinetd/xinetd.mk b/package/xinetd/xinetd.mk
index 1fb91b5..0ecc1ad 100644
--- a/package/xinetd/xinetd.mk
+++ b/package/xinetd/xinetd.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-XINETD_VERSION = 2.3.15
-XINETD_SITE = http://www.xinetd.org
+XINETD_VERSION = 2-3-15
+XINETD_SOURCE = xinetd-$(XINETD_VERSION).tar.gz
+XINETD_SITE = https://github.com/xinetd-org/xinetd/archive
 XINETD_LICENSE = xinetd license
 XINETD_LICENSE_FILES = COPYRIGHT
 
-- 
1.7.10.4
