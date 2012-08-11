From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 11 Aug 2012 19:27:30 -0300
Subject: [Buildroot] [PATCH 5/8] wget: bump to version 1.14
In-Reply-To: <1344724053-10165-1-git-send-email-gustavo@zacarias.com.ar>
References: <1344724053-10165-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1344724053-10165-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wget/wget.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index a15111c..9be9c0d 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -6,6 +6,8 @@
 
 WGET_VERSION = 1.13.4
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
+WGET_LICENSE = GPLv3+
+WGET_LICENSE_FILES = COPYING
 
 # Prefer full-blown wget over busybox
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-- 
1.7.8.6
