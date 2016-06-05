From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Jun 2016 19:52:14 +0200
Subject: [Buildroot] [PATCH 21/28] package/odhcp6c: bump version
In-Reply-To: <1465149141-15774-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465149141-15774-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1465149141-15774-21-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/odhcp6c/odhcp6c.hash | 2 +-
 package/odhcp6c/odhcp6c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/odhcp6c/odhcp6c.hash b/package/odhcp6c/odhcp6c.hash
index 00a0960..688d77d 100644
--- a/package/odhcp6c/odhcp6c.hash
+++ b/package/odhcp6c/odhcp6c.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	b5f920ed300309d65e431a360cae5f3c2010eca09a4231c9ef907c730d3c0d09	odhcp6c-dc186d6d2b0dd4ad23ca5fc69c00e81f796ff6d9.tar.gz
+sha256 d84a713010865215301b4186c7b5368c9f006e6d3b9b52b99bd25e2d9e7a1dfc odhcp6c-7533a6243dc3ac5a747cf6ccbc4d0539dafd3e07.tar.gz
diff --git a/package/odhcp6c/odhcp6c.mk b/package/odhcp6c/odhcp6c.mk
index c841cd3..0ec9657 100644
--- a/package/odhcp6c/odhcp6c.mk
+++ b/package/odhcp6c/odhcp6c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ODHCP6C_VERSION = dc186d6d2b0dd4ad23ca5fc69c00e81f796ff6d9
+ODHCP6C_VERSION = 7533a6243dc3ac5a747cf6ccbc4d0539dafd3e07
 ODHCP6C_SITE = $(call github,sbyx,odhcp6c,$(ODHCP6C_VERSION))
 ODHCP6C_LICENSE = GPLv2
 ODHCP6C_LICENSE_FILES = COPYING
-- 
2.8.1
