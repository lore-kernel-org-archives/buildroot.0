From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 27 Apr 2014 09:36:44 +0300
Subject: [Buildroot] [PATCH] filemq: bump git snapshot
Message-ID: <dc2ea6e636f598ace1aafde0032a44369e3f62e1.1398580604.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For API compatibility with czmq version 2.2.0.

Fixes:
http://autobuild.buildroot.net/results/971/971e2f88a533cc829516b1cf426f6b1c27d0d82b/

Also, switch to github helper.

Cc: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/filemq/filemq.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/filemq/filemq.mk b/package/filemq/filemq.mk
index 8cf69bc8e0cf..69469c698a35 100644
--- a/package/filemq/filemq.mk
+++ b/package/filemq/filemq.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FILEMQ_VERSION = c398c096a427d341e9323d7673e6e0ca5e43902a
-FILEMQ_SITE = git://github.com/zeromq/filemq.git
+FILEMQ_VERSION = 9a24134d4c0a84abc5eebf1dfb2eb184adee72df
+FILEMQ_SITE = $(call github,zeromq,filemq,$(FILEMQ_VERSION))
 
 FILEMQ_AUTORECONF = YES
 FILEMQ_CONF_ENV = fmq_have_asciidoc=no
-- 
1.9.2
