From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 18 Oct 2016 20:05:39 +0200
Subject: [Buildroot] [PATCH v1] wireshark: fix libgtk2 dependency typo
Message-ID: <1476813939-7730-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/wireshark/wireshark.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 8dc72da..9cd92c4 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -32,7 +32,7 @@ WIRESHARK_CONF_OPTS += --with-gtk=3
 WIRESHARK_DEPENDENCIES += libgtk3
 else ifeq ($(BR2_PACKAGE_LIBGTK2),y)
 WIRESHARK_CONF_OPTS += --with-gtk=2
-WIRESHARK_DEPENDECIES += libgtk2
+WIRESHARK_DEPENDENCIES += libgtk2
 else
 WIRESHARK_CONF_OPTS += --with-gtk=no
 endif
-- 
2.8.1
