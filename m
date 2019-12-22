From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 14:19:52 +0100
Subject: [Buildroot] [git commit] package/rpcbind: add an upstream URL to
 Config.in
Message-ID: <20191222131048.DDBFE8D5E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=14dabed5ef0512fdaa7e76531ae8747d7cd94184
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rpcbind/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rpcbind/Config.in b/package/rpcbind/Config.in
index ced2d40944..9cde7bba39 100644
--- a/package/rpcbind/Config.in
+++ b/package/rpcbind/Config.in
@@ -9,6 +9,8 @@ config BR2_PACKAGE_RPCBIND
 	  The rpcbind utility is a server that converts RPC program
 	  numbers into universal addresses.
 
+	  https://sourceforge.net/projects/rpcbind/
+
 comment "rpcbind needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
