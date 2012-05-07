From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  7 May 2012 22:12:38 +0200
Subject: [Buildroot] [PATCH v3 17/22] lzo: define license
In-Reply-To: <1336421563-5986-1-git-send-email-luca@lucaceresoli.net>
References: <1336421443-5871-1-git-send-email-luca@lucaceresoli.net>
 <1336421563-5986-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1336421563-5986-17-git-send-email-luca@lucaceresoli.net>
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
index 84f31f0..da5d6b7 100644
--- a/package/lzo/lzo.mk
+++ b/package/lzo/lzo.mk
@@ -5,6 +5,8 @@
 #############################################################
 LZO_VERSION = 2.06
 LZO_SITE = http://www.oberhumer.com/opensource/lzo/download
+LZO_LICENSE = GPLv2+
+LZO_LICENSE_FILES = COPYING
 LZO_INSTALL_STAGING = YES
 
 $(eval $(call AUTOTARGETS))
-- 
1.7.5.4
