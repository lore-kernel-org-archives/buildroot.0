From: Mark Corbin <mark@dibsco.co.uk>
Date: Wed, 18 Dec 2019 13:37:17 +0000
Subject: [Buildroot] [PATCH 1/1] package/tftpd: add an upstream URL to
 Config.in
Message-ID: <20191218133717.28343-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 package/tftpd/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/tftpd/Config.in b/package/tftpd/Config.in
index ea5cb303f9..b9e1eff7a3 100644
--- a/package/tftpd/Config.in
+++ b/package/tftpd/Config.in
@@ -6,3 +6,5 @@ config BR2_PACKAGE_TFTPD
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  HPA's Trivial File Transfer Protocol (tftp) server.
+
+	  http://freshmeat.sourceforge.net/projects/tftp-hpa
-- 
2.20.1
