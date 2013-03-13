From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 13 Mar 2013 23:07:02 +0100
Subject: [Buildroot] [git commit] poco: bump to 1.4.6p1
Message-ID: <20130313221243.0EEAC9B088@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=19d1cfdb25b4a313b8f916ae80da9f60dc134bf5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/poco/poco.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 942b9b2..32a026b 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -3,8 +3,8 @@
 # poco
 #
 #############################################################
-POCO_VERSION_MAJOR = 1.4.4
-POCO_VERSION = $(POCO_VERSION_MAJOR)
+POCO_VERSION_MAJOR = 1.4.6
+POCO_VERSION = $(POCO_VERSION_MAJOR)p1
 POCO_SOURCE = poco-$(POCO_VERSION)-all.tar.gz
 POCO_SITE = http://downloads.sourceforge.net/project/poco/sources/poco-$(POCO_VERSION_MAJOR)
 POCO_LICENSE = Boost-v1.0
