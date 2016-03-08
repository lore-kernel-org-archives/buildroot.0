From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 23:59:35 +0100
Subject: [Buildroot] [git commit] collectd: indentation cleanup
Message-ID: <20160308225957.6AEAD802CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c760104e3b50a9296d0da07d9297dba99228c9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
