From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Fri, 30 Apr 2010 02:24:10 +0200
Subject: [Buildroot] [PATCH 5/8] libtool: added LIBTOOLIZE variable to point
	on $(HOST_DIR)/usr/bin/libtoolize
In-Reply-To: <1272587053-19535-1-git-send-email-llandwerlin@gmail.com>
References: <1272587053-19535-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1272587053-19535-6-git-send-email-llandwerlin@gmail.com>
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
1.7.0.4
