From: Kees van Unen <keesvanunen@hotmail.com>
Date: Fri, 15 Dec 2017 18:54:57 +0000
Subject: [Buildroot] FW:  [PATCH 1/1] package/boinc: indentation cleanup
In-Reply-To: <1513364079-9586-1-git-send-email-jerzy.m.grzegorek@gmail.com>
References: <1513364079-9586-1-git-send-email-jerzy.m.grzegorek@gmail.com>
Message-ID: <d3a55e111d7b470690ad167a556e0aee@AM5PR0801MB1394.eurprd08.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net




________________________________________
Van: buildrootNamensJerzy Grzegorek
Verzonden: vrijdag 15 december 2017 19:54:39 (UTC+01:00) Amsterdam, Berlijn, Bern, Rome, Stockholm, Wenen
Aan: buildroot at buildroot.org
CC: Jerzy Grzegorek
Onderwerp: [Buildroot] [PATCH 1/1] package/boinc: indentation cleanup

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
---
 package/boinc/boinc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
index a04aadf..56959e2 100644
--- a/package/boinc/boinc.mk
+++ b/package/boinc/boinc.mk
@@ -45,7 +45,7 @@ endef
 BOINC_POST_INSTALL_TARGET_HOOKS += BOINC_REMOVE_UNNEEDED_FILE

 define BOINC_INSTALL_INIT_SYSV
-        $(INSTALL) -D -m 0755 package/boinc/S99boinc-client \
+       $(INSTALL) -D -m 0755 package/boinc/S99boinc-client \
                $(TARGET_DIR)/etc/init.d/S99boinc-client
 endef

--
1.9.1

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
