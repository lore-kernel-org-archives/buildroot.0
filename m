From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 12 Jun 2013 11:14:28 -0300
Subject: [Buildroot] [PATCH 4/5] sdparm: bump to version 1.08
In-Reply-To: <1371046469-19194-1-git-send-email-gustavo@zacarias.com.ar>
References: <1371046469-19194-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1371046469-19194-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sdparm/sdparm.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/sdparm/sdparm.mk b/package/sdparm/sdparm.mk
index ef30887..1b3ec4b 100644
--- a/package/sdparm/sdparm.mk
+++ b/package/sdparm/sdparm.mk
@@ -1,6 +1,12 @@
-SDPARM_VERSION = 1.07
+################################################################################
+#
+# sdparm
+#
+################################################################################
+
+SDPARM_VERSION = 1.08
 SDPARM_SOURCE = sdparm-$(SDPARM_VERSION).tgz
-SDPARM_SITE = http://sg.danny.cz/sg/p/
+SDPARM_SITE = http://sg.danny.cz/sg/p
 SDPARM_LICENSE = BSD-3c
 SDPARM_LICENSE_FILES = COPYING
 
-- 
1.8.1.5
