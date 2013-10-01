From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Oct 2013 21:22:42 +0200
Subject: [Buildroot] [git commit] ngircd: bump to version 20.3
Message-ID: <20131001193429.5AF499B902@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7d305cce194438324a63ac15f0e989dbfdfb4dc6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ngircd/ngircd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ngircd/ngircd.mk b/package/ngircd/ngircd.mk
index 41a5b49..c99e6bb 100644
--- a/package/ngircd/ngircd.mk
+++ b/package/ngircd/ngircd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGIRCD_VERSION = 17.1
+NGIRCD_VERSION = 20.3
 NGIRCD_SITE = ftp://ftp.berlios.de/pub/ngircd/
 NGIRCD_DEPENDENCIES = zlib
 
