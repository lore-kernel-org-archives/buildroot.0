From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Oct 2014 19:45:52 +0100
Subject: [Buildroot] [PATCH 46/51] neardal: bump version
In-Reply-To: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1414349157-22749-46-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/neardal/neardal.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/neardal/neardal.mk b/package/neardal/neardal.mk
index 0720fe8..821adfc 100644
--- a/package/neardal/neardal.mk
+++ b/package/neardal/neardal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NEARDAL_VERSION = da8e06d3884d214bb19b894d2b8fdc9c7ca8575f
+NEARDAL_VERSION = 33b54a55032b047fd885a5eb3592c169c0056c49
 NEARDAL_SITE = $(call github,connectivity,neardal,$(NEARDAL_VERSION))
 NEARDAL_INSTALL_STAGING = YES
 NEARDAL_LICENSE = GPLv2
-- 
2.1.1
