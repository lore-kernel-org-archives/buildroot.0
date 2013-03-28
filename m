From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 28 Mar 2013 08:48:40 -0300
Subject: [Buildroot] [PATCHv2] fbset: needs host-bison and host-flex
Message-ID: <1364471320-12833-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/08d6d70f7c89617c20e727e77e0f6be09974dfc1/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/fbset/fbset.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fbset/fbset.mk b/package/fbset/fbset.mk
index b8a8f43..920ccc8 100644
--- a/package/fbset/fbset.mk
+++ b/package/fbset/fbset.mk
@@ -7,6 +7,7 @@
 FBSET_VERSION = 2.1
 FBSET_SOURCE = fbset-$(FBSET_VERSION).tar.gz
 FBSET_SITE = http://users.telenet.be/geertu/Linux/fbdev
+FBSET_DEPENDENCIES = host-bison host-flex
 FBSET_LICENSE = GPLv2
 
 # Make sure full fbset wins over busybox fbset
-- 
1.8.1.5
