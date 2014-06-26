From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:20:37 -0300
Subject: [Buildroot] [PATCH 09/53] explorercanvas: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-9-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/explorercanvas/explorercanvas.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/explorercanvas/explorercanvas.mk b/package/explorercanvas/explorercanvas.mk
index 1d9363d..c360e96 100644
--- a/package/explorercanvas/explorercanvas.mk
+++ b/package/explorercanvas/explorercanvas.mk
@@ -7,6 +7,8 @@
 EXPLORERCANVAS_VERSION = r3
 EXPLORERCANVAS_SITE = http://explorercanvas.googlecode.com/files/
 EXPLORERCANVAS_SOURCE = excanvas_$(EXPLORERCANVAS_VERSION).zip
+EXPLORERCANVAS_LICENSE = Apache-2.0
+EXPLORERCANVAS_LICENSE_FILES = COPYING
 
 define EXPLORERCANVAS_EXTRACT_CMDS
 	unzip -d $(@D) $(DL_DIR)/$(EXPLORERCANVAS_SOURCE)
-- 
1.8.5.5
