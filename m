From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 19 Jun 2012 18:59:02 +0200
Subject: [Buildroot] [PATCH 1/2] qt: remove redundant and incorrect URL from
	Makefile
Message-ID: <1340125143-8683-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The upstream URL for Buildroot packages is usually visible in the Config.in
file, not in comments in the Makefile.

Moreover, this URL does not point to the correct upstream project.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/qt/qt.mk |    1 -
 1 file changed, 1 deletion(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index b751696..ff9f4ca 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -1,7 +1,6 @@
 ######################################################################
 #
 # Qt Embedded for Linux
-# http://www.qtsoftware.com/
 #
 # This makefile was originally composed by Thomas Lundquist <thomasez@zelow.no>
 # Later heavily modified by buildroot developers
-- 
1.7.9.5
