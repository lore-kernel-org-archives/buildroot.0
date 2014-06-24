From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:59 -0300
Subject: [Buildroot] [PATCH 53/54] ti-utils: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-53-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ti-utils/ti-utils.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ti-utils/ti-utils.mk b/package/ti-utils/ti-utils.mk
index 1d1c1e6..c0a3663 100644
--- a/package/ti-utils/ti-utils.mk
+++ b/package/ti-utils/ti-utils.mk
@@ -7,6 +7,8 @@
 TI_UTILS_VERSION = 06dbdb2727354b5f3ad7c723897f40051fddee49
 TI_UTILS_SITE = $(call github,gxk,ti-utils,$(TI_UTILS_VERSION))
 TI_UTILS_DEPENDENCIES = libnl
+TI_UTILS_LICENSE = BSD-3c
+TI_UTILS_LICENSE_FILES = COPYING
 
 define TI_UTILS_BUILD_CMDS
 	$(MAKE1) NFSROOT="$(STAGING_DIR)" \
-- 
1.8.5.5
