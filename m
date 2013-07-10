From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 10 Jul 2013 15:39:18 -0300
Subject: [Buildroot] [PATCH 3/3] python3: remove smtpd.py.3 sample
In-Reply-To: <1373481558-30193-1-git-send-email-gustavo@zacarias.com.ar>
References: <1373481558-30193-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1373481558-30193-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/python3/python3.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index ed79f8e..036d1ac 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -141,6 +141,7 @@ define PYTHON3_REMOVE_USELESS_FILES
 	rm -f $(TARGET_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR)-config
 	rm -f $(TARGET_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR)m-config
 	rm -f $(TARGET_DIR)/usr/bin/python3-config
+	rm -f $(TARGET_DIR)/usr/bin/smtpd.py.3
 	for i in `find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/config-3.3m/ \
 		-type f -not -name pyconfig.h -a -not -name Makefile` ; do \
 		rm -f $$i ; \
-- 
1.8.1.5
