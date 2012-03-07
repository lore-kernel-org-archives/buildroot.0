From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  7 Mar 2012 21:58:22 +0100
Subject: [Buildroot] [RFC v2 22/31] lzo: define license
In-Reply-To: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
References: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1331153911-22277-23-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/lzo/lzo.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/lzo/lzo.mk b/package/lzo/lzo.mk
index 84f31f0..04033ac 100644
--- a/package/lzo/lzo.mk
+++ b/package/lzo/lzo.mk
@@ -5,6 +5,8 @@
 #############################################################
 LZO_VERSION = 2.06
 LZO_SITE = http://www.oberhumer.com/opensource/lzo/download
+LZO_LICENSE = GPLv2
+LZO_LICENSE_FILES = COPYING
 LZO_INSTALL_STAGING = YES
 
 $(eval $(call AUTOTARGETS))
-- 
1.7.5.4
