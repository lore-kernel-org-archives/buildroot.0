From: Mark Corbin <mark@dibsco.co.uk>
Date: Thu, 28 Nov 2019 12:45:52 +0000
Subject: [Buildroot] [PATCH 1/1] package/liblockfile: add an upstream URL to
 Config.in
Message-ID: <20191128124552.2016-1-mark@dibsco.co.uk>
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
 package/liblockfile/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/liblockfile/Config.in b/package/liblockfile/Config.in
index 88a9c338bb..83ffea86c8 100644
--- a/package/liblockfile/Config.in
+++ b/package/liblockfile/Config.in
@@ -2,3 +2,5 @@ config BR2_PACKAGE_LIBLOCKFILE
 	bool "liblockfile"
 	help
 	  NFS-safe locking library.
+
+	  https://github.com/miquels/liblockfile
-- 
2.20.1
