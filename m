From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Mar 2017 14:09:13 +0100
Subject: [Buildroot] [git commit] package/libscrypt: indentation cleanup
Message-ID: <20170319131837.C762980584@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c961a9b5220a2d0db562fe91634daa496f762ad0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
