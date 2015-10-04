From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Oct 2015 12:05:45 +0200
Subject: [Buildroot] [git commit] lz4: adjust homepage URL
Message-ID: <20151004100731.43E8181D65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bcf696802b495e95d6db4e0b06396c2546f878f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Lz4 is no longer developed on google code.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lz4/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lz4/Config.in b/package/lz4/Config.in
index 677658c..4a00a70 100644
--- a/package/lz4/Config.in
+++ b/package/lz4/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_LZ4
 	  in multiple GB/s per core, typically reaching RAM speed limits
 	  on multi-core systems.
 
-	  https://code.google.com/p/lz4/
+	  http://www.lz4.org/
