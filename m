From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 21 Jan 2013 19:55:42 -0300
Subject: [Buildroot] [PATCH 2/3] xz: add XZ definition for the host variant
In-Reply-To: <1358808943-17063-1-git-send-email-gustavo@zacarias.com.ar>
References: <1358808943-17063-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1358808943-17063-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/xz/xz.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 8ff3c83..877c631 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -14,3 +14,5 @@ XZ_LICENSE_FILES = COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
+
+XZ = $(HOST_DIR)/usr/bin/xz
-- 
1.7.12.4
