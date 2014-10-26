From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Oct 2014 19:45:12 +0100
Subject: [Buildroot] [PATCH 06/51] filemq: bump version
In-Reply-To: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1414349157-22749-6-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/filemq/filemq.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/filemq/filemq.mk b/package/filemq/filemq.mk
index 69469c6..d3dc6da 100644
--- a/package/filemq/filemq.mk
+++ b/package/filemq/filemq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FILEMQ_VERSION = 9a24134d4c0a84abc5eebf1dfb2eb184adee72df
+FILEMQ_VERSION = 482797b8aa30fcc9ea1377aabdf2b0769f9f698e
 FILEMQ_SITE = $(call github,zeromq,filemq,$(FILEMQ_VERSION))
 
 FILEMQ_AUTORECONF = YES
-- 
2.1.1
