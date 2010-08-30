From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 30 Aug 2010 23:37:20 +0200
Subject: [Buildroot] [git commit master 1/1] Add JFFS2 SREC format
	description
Message-ID: <20100830213746.7E03789019@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=31aa331d34a67dd5a819d9a78aa0e265ff0b8bf3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add JFFS2 SREC format description

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/jffs2/Config.in |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/fs/jffs2/Config.in b/fs/jffs2/Config.in
index b787ec9..3f16568 100644
--- a/fs/jffs2/Config.in
+++ b/fs/jffs2/Config.in
@@ -81,7 +81,9 @@ config BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER
 	  the pagesize is not a power of 2
 
 config BR2_JFFS2_TARGET_SREC
-	bool "RootFS in SREC file formet"
+	bool "RootFS in SREC file format"
+	help
+	  The binary data will be encoded in Motorola's S-record format
 
 config BR2_TARGET_ROOTFS_JFFS2_PAD
 	bool "Pad output"
-- 
1.7.1
