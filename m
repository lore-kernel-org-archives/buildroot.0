From: Axel Lin <axel.lin@ingics.com>
Date: Wed, 09 Oct 2013 10:18:27 +0800
Subject: [Buildroot] [PATCH] nano: bump to version 2.3.2
Message-ID: <1381285107.27485.10.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/nano/nano.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index b1a8f44..aba4b4f 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NANO_VERSION = 2.3.1
+NANO_VERSION = 2.3.2
 NANO_SITE = http://www.nano-editor.org/dist/v2.3
 NANO_LICENSE = GPLv3+
 NANO_LICENSE_FILES = COPYING
-- 
1.8.1.2
