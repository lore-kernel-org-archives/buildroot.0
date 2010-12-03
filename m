From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 3 Dec 2010 11:56:58 +0100
Subject: [Buildroot] [git commit master 1/1] cloop: fix download URL
Message-ID: <20101205211156.B076E8E11D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9de2a8513e34da0b4e8cd4ea542ee1d449989a8c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                |    2 +-
 package/cloop/cloop.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 04984a6..77ceee0 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,6 +1,6 @@
 2011.02, Not yet released:
 
-	Updated/fixed packages:
+	Updated/fixed packages: cloop
 
 2010.11, Released November 30th, 2010:
 
diff --git a/package/cloop/cloop.mk b/package/cloop/cloop.mk
index f1c1e1c..0ed9ff0 100644
--- a/package/cloop/cloop.mk
+++ b/package/cloop/cloop.mk
@@ -1,6 +1,6 @@
 CLOOP_VERSION=2.631-1
 CLOOP_SOURCE=cloop_$(CLOOP_VERSION).tar.gz
-CLOOP_SITE=http://debian-knoppix.alioth.debian.org/sources/
+CLOOP_SITE=http://debian-knoppix.alioth.debian.org/packages/sources/cloop
 
 HOST_CLOOP_DEPENDENCIES = host-zlib
 
-- 
1.7.2.2
