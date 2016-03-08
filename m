From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue,  8 Mar 2016 22:58:04 +0100
Subject: [Buildroot] [PATCH 2/4] collectd: indentation cleanup
In-Reply-To: <1457474286-18685-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1457474286-18685-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1457474286-18685-2-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/collectd/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index ec7e942..71301ec 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -333,7 +333,7 @@ config BR2_PACKAGE_COLLECTD_OPENLDAP
 	  Read monitoring information from OpenLDAP's cn=Monitor subtree.
 
 comment "openldap support needs a toolchain w/ wchar"
-        depends on !BR2_USE_WCHAR
+	depends on !BR2_USE_WCHAR
 
 config BR2_PACKAGE_COLLECTD_OPENVPN
 	bool "openvpn"
@@ -385,7 +385,7 @@ config BR2_PACKAGE_COLLECTD_SMART
 	  and bad sectors.
 
 comment "SMART requires udev to be enabled"
-        depends on !BR2_PACKAGE_HAS_UDEV
+	depends on !BR2_PACKAGE_HAS_UDEV
 
 config BR2_PACKAGE_COLLECTD_STATSD
 	bool "StatsD"
-- 
1.9.1
