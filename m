From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Oct 2014 19:45:13 +0100
Subject: [Buildroot] [PATCH 07/51] flann: bump version
In-Reply-To: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1414349157-22749-7-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/flann/flann.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flann/flann.mk b/package/flann/flann.mk
index bbf1e03..30f6c64 100644
--- a/package/flann/flann.mk
+++ b/package/flann/flann.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLANN_VERSION = d0c04f4d290ebc3aa9411a3322992d298e51f5aa
+FLANN_VERSION = 04b4a56533faf8c8228d011d05ba376038364b49
 FLANN_SITE = $(call github,mariusmuja,flann,$(FLANN_VERSION))
 FLANN_INSTALL_STAGING = YES
 FLANN_LICENSE = BSD-3c
-- 
2.1.1
