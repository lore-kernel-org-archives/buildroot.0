From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:20:33 -0300
Subject: [Buildroot] [PATCH 05/53] devmem2: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/devmem2/devmem2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/devmem2/devmem2.mk b/package/devmem2/devmem2.mk
index ab111e1..7f0594e 100644
--- a/package/devmem2/devmem2.mk
+++ b/package/devmem2/devmem2.mk
@@ -7,6 +7,8 @@
 DEVMEM2_SITE = http://free-electrons.com/pub/mirror
 DEVMEM2_SOURCE = devmem2.c
 DEVMEM2_VERSION = 1
+DEVMEM2_LICENSE = GPLv2+
+DEVMEM2_LICENSE_FILES = devmem2.c
 
 define DEVMEM2_EXTRACT_CMDS
 	cp $(DL_DIR)/$($(PKG)_SOURCE) $(@D)/
-- 
1.8.5.5
