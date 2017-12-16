From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Dec 2017 15:29:22 +0100
Subject: [Buildroot] [git commit] package/boinc: indentation cleanup
Message-ID: <20171216142928.9C7507FBA9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cdfd3fe7ada4f18761f172a98d36e3044fd99016
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/boinc/boinc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
index a04aadf..04f85ae 100644
--- a/package/boinc/boinc.mk
+++ b/package/boinc/boinc.mk
@@ -45,7 +45,7 @@ endef
 BOINC_POST_INSTALL_TARGET_HOOKS += BOINC_REMOVE_UNNEEDED_FILE
 
 define BOINC_INSTALL_INIT_SYSV
-	 $(INSTALL) -D -m 0755 package/boinc/S99boinc-client \
+	$(INSTALL) -D -m 0755 package/boinc/S99boinc-client \
 		$(TARGET_DIR)/etc/init.d/S99boinc-client
 endef
 
