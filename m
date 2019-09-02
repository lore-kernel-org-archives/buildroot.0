From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 13:17:27 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/dhcp: inform
 about omshell in the help message
Message-ID: <20190902113832.C110A88FD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c41f013d87adbd138b6a968743dbb0eb92fe7a22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Document that along with the server we install omshell, an interactive
tool to connect to, query, and possibly change, the server's state via
the Object Management API (OMAPI).

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 79ba55df5aa255aa40162b1c6e31593e25e9e2bb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
