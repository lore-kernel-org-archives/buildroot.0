From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Oct 2014 19:45:26 +0100
Subject: [Buildroot] [PATCH 20/51] lz4: bump version
In-Reply-To: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1414349157-22749-20-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/lz4/lz4.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index 819cc54..761ce4d 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LZ4_VERSION = r119
+LZ4_VERSION = r123
 LZ4_SITE = $(call github,Cyan4973,lz4,$(LZ4_VERSION))
 LZ4_INSTALL_STAGING = YES
 LZ4_LICENSE = BSD-2c
-- 
2.1.1
