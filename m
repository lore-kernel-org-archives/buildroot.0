From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sun,  7 Feb 2010 19:07:52 +0100
Subject: [Buildroot] [PATCH 10/14] libtool: added LIBTOOLIZE variable to
	point on $(HOST_DIR)/usr/bin/libtoolize
In-Reply-To: <1265566076-10628-1-git-send-email-llandwerlin@gmail.com>
References: <1265566076-10628-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1265566076-10628-11-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/libtool/libtool.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index bbabbb0..4278029 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -25,3 +25,4 @@ $(eval $(call AUTOTARGETS,package,libtool,host))
 
 # variables used by other packages
 LIBTOOL:=$(HOST_DIR)/usr/bin/libtool
+LIBTOOLIZE:=$(HOST_DIR)/usr/bin/libtoolize
-- 
1.6.6
