From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun,  3 May 2020 16:43:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/wlroots: add license file
 information
In-Reply-To: <20200503144356.275259-1-gilles.talis@gmail.com>
References: <20200503144356.275259-1-gilles.talis@gmail.com>
Message-ID: <20200503144356.275259-2-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/wlroots/wlroots.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index 136dc2bfcd..988643485f 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -7,6 +7,7 @@
 WLROOTS_VERSION = 0.10.1
 WLROOTS_SITE = https://github.com/swaywm/wlroots/releases/download/$(WLROOTS_VERSION)
 WLROOTS_LICENSE = MIT
+WLROOTS_LICENSE_FILES = LICENSE
 WLROOTS_INSTALL_STAGING = YES
 
 WLROOTS_DEPENDENCIES = \
-- 
2.25.1
