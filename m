From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 May 2013 18:29:37 +0200
Subject: [Buildroot] [PATCH 15/16] python3: remove another config script
In-Reply-To: <1368203379-3385-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1368203379-3385-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1368203379-3385-16-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python3/python3.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 7551a7b..239ac8f 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -130,6 +130,7 @@ PYTHON3_POST_INSTALL_STAGING_HOOKS += PYTHON3_FIXUP_LIBDIR
 #
 define PYTHON3_REMOVE_DEVFILES
 	rm -f $(TARGET_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR)-config
+	rm -f $(TARGET_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR)m-config
 	rm -f $(TARGET_DIR)/usr/bin/python3-config
 endef
 
-- 
1.7.9.5
