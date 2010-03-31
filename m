From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 31 Mar 2010 10:53:12 +0200
Subject: [Buildroot] [git commit master] CHANGES: add #1327
Message-ID: <20100331085411.5982B20AEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=820d917d687e14e95bb9430f57c3cdb38d0f0d1a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Got fixed by d5bf5f967009733.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 0a3a87a..d802538 100644
--- a/CHANGES
+++ b/CHANGES
@@ -25,6 +25,7 @@
 	#1129: Bump memstat to 0.8 and migrate to Makefile.package.in
 	#1273: BR2_INET_IPV6 does not enable IPv6 in pppd
 	#1303: Add librsync package
+	#1327: mtd-utils compile failure due to lack of --sysroot in CFLAGS
 	#1345: Bump pppd to 2.4.5 and convert to Makefile.autotools.in
 	#1441: Add binutils 2.20.1
 	#1447: Package installation on target with debug symbols is broken
-- 
1.6.3.3
