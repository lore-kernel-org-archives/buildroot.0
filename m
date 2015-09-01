From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Date: Tue,  1 Sep 2015 10:10:31 +0200
Subject: [Buildroot] [PATCH 5/6] targetcli-fb: bump version
In-Reply-To: <1441095032-5656-1-git-send-email-cvubrugier@fastmail.fm>
References: <1441095032-5656-1-git-send-email-cvubrugier@fastmail.fm>
Message-ID: <1441095032-5656-5-git-send-email-cvubrugier@fastmail.fm>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add new dependency to python-six.

Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
---
 package/targetcli-fb/targetcli-fb.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/targetcli-fb/targetcli-fb.mk b/package/targetcli-fb/targetcli-fb.mk
index b5f2fbe..0a64c46 100644
--- a/package/targetcli-fb/targetcli-fb.mk
+++ b/package/targetcli-fb/targetcli-fb.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-TARGETCLI_FB_VERSION = v2.1.fb37
+TARGETCLI_FB_VERSION = v2.1.fb41
 TARGETCLI_FB_SITE = $(call github,agrover,targetcli-fb,$(TARGETCLI_FB_VERSION))
 TARGETCLI_FB_LICENSE = Apache-2.0
 TARGETCLI_FB_LICENSE_FILES = COPYING
 TARGETCLI_FB_SETUP_TYPE = setuptools
-TARGETCLI_FB_DEPENDENCIES = python-configshell-fb python-rtslib-fb
+TARGETCLI_FB_DEPENDENCIES = python-configshell-fb python-rtslib-fb python-six
 
 define TARGETCLI_FB_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/targetcli-fb/S50target $(TARGET_DIR)/etc/init.d/S50target
-- 
2.5.0
