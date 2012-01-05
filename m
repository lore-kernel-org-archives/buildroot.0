From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  5 Jan 2012 15:26:21 -0300
Subject: [Buildroot] [PATCH 08/10] ed: bump to version 1.6
In-Reply-To: <1325787983-8591-1-git-send-email-gustavo@zacarias.com.ar>
References: <1325787983-8591-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1325787983-8591-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ed/ed.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index 2196af0..f5a4b22 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-ED_VERSION = 1.5
+ED_VERSION = 1.6
 ED_SITE = $(BR2_GNU_MIRROR)/ed
 ED_CONF_OPT = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)"
-- 
1.7.3.4
