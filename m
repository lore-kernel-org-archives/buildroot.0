From: Alexey Mednyy <swexru@gmail.com>
Date: Sun, 12 Oct 2014 12:20:32 +0400
Subject: [Buildroot] [PATCH 2/3] bump-libuci-to-upstream-version
In-Reply-To: <1413102033-3263-1-git-send-email-swexru@gmail.com>
References: <1413102033-3263-1-git-send-email-swexru@gmail.com>
Message-ID: <1413102033-3263-2-git-send-email-swexru@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexey Mednyy <swexru@gmail.com>
---
 package/libuci/libuci.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
index ce18a38..9d5c172 100644
--- a/package/libuci/libuci.mk
+++ b/package/libuci/libuci.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUCI_VERSION = ed938cc8e423d4a33b8f31e6e6d1eb0805ae3d10
+LIBUCI_VERSION = e339407372ffc70b1451e4eda218c01aa95a6a7f
 LIBUCI_SITE = git://nbd.name/uci.git
 LIBUCI_LICENSE = LGPLv2.1
 LIBUCI_INSTALL_STAGING = YES
-- 
1.9.1
