From: Mark Corbin <mark@dibsco.co.uk>
Date: Wed, 18 Dec 2019 11:23:44 +0000
Subject: [Buildroot] [PATCH 1/1] package/rpcbind: add an upstream URL to
 Config.in
Message-ID: <20191218112344.9830-1-mark@dibsco.co.uk>
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
-- 
2.20.1
