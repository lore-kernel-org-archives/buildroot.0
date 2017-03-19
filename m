From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Sun, 19 Mar 2017 10:59:48 +0100
Subject: [Buildroot] [PATCH 1/5] package/libscrypt: indentation cleanup
Message-ID: <1489917592-12454-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/libscrypt/libscrypt.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libscrypt/libscrypt.mk b/package/libscrypt/libscrypt.mk
index 5326b22..a0dcce0 100644
--- a/package/libscrypt/libscrypt.mk
+++ b/package/libscrypt/libscrypt.mk
@@ -15,12 +15,12 @@ define LIBSCRYPT_BUILD_CMDS
 endef
 
 define LIBSCRYPT_INSTALL_STAGING_CMDS
-        $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=/usr \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=/usr \
 		DESTDIR=$(STAGING_DIR) install
 endef
 
 define LIBSCRYPT_INSTALL_TARGET_CMDS
-        $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=/usr \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=/usr \
 		DESTDIR=$(TARGET_DIR) install
 endef
 
-- 
1.9.1
