From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2019 10:09:59 +0100
Subject: [Buildroot] [git commit] package/liblockfile: add an upstream URL
 to Config.in
Message-ID: <20191129090526.1217F80418@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=53996e2ed26d972862b64c90522fe0352426fee2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
