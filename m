From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  3 Dec 2012 11:45:59 -0300
Subject: [Buildroot] [PATCH 01/14] scons: bump to version 2.2.0
Message-ID: <1354545972-26783-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/scons/scons.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index d2489a0..79fd6b1 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -1,4 +1,4 @@
-SCONS_VERSION = 2.0.1
+SCONS_VERSION = 2.2.0
 SCONS_SOURCE = scons-$(SCONS_VERSION).tar.gz
 SCONS_SITE = http://downloads.sourceforge.net/project/scons/scons/$(SCONS_VERSION)
 SCONS_LICENSE = MIT
-- 
1.7.8.6
