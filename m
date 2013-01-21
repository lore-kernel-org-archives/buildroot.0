From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 21 Jan 2013 18:29:47 -0300
Subject: [Buildroot] [PATCH 07/10] haserl: add license information
In-Reply-To: <1358803790-30245-1-git-send-email-gustavo@zacarias.com.ar>
References: <1358803790-30245-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1358803790-30245-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/haserl/haserl.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/haserl/haserl.mk b/package/haserl/haserl.mk
index 589b3e7..7627917 100644
--- a/package/haserl/haserl.mk
+++ b/package/haserl/haserl.mk
@@ -6,6 +6,8 @@
 
 HASERL_VERSION = $(call qstrip,$(BR2_PACKAGE_HASERL_VERSION))
 HASERL_SITE = http://downloads.sourceforge.net/project/haserl/haserl-devel/$(HASERL_VERSION)
+HASERL_LICENSE = GPLv2
+HASERL_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_HASERL_WITH_LUA),y)
 	HASERL_CONF_OPT += --with-lua=$(STAGING_DIR) \
-- 
1.7.12.4
