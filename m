From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sat, 10 Aug 2019 20:16:43 -0300
Subject: [Buildroot] [PATCH] package/dhcp: iform about omshell in the help
 message
Message-ID: <20190810231643.17587-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Document that along with the server we install omshell, an interactive
tool to connect to, query, and possibly change, the server's state via
the Object Management API (OMAPI).

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/dhcp/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/dhcp/Config.in b/package/dhcp/Config.in
index e626d78a4c..e6e70908dd 100644
--- a/package/dhcp/Config.in
+++ b/package/dhcp/Config.in
@@ -17,6 +17,10 @@ config BR2_PACKAGE_DHCP_SERVER
 	help
 	  DHCP server from the ISC DHCP distribution.
 
+	  This also installs omshell, an interactive tool to connect to,
+	  query, and possibly change, the server's state via the Object
+	  Management API (OMAPI).
+
 config BR2_PACKAGE_DHCP_SERVER_DELAYED_ACK
 	bool "Enable delayed ACK feature"
 	depends on BR2_PACKAGE_DHCP_SERVER
-- 
2.18.1
