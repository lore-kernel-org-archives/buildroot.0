From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 22 Mar 2012 21:33:24 +0100
Subject: [Buildroot] [git commit] poco: bump to 1.4.3p1
Message-ID: <20120322203947.4D60C9693C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f3354649819e5012538217c8aea842b36846534d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/poco/poco.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 5d07972..ddb5b25 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -3,7 +3,7 @@
 # poco
 #
 #############################################################
-POCO_VERSION = 1.4.2p1
+POCO_VERSION = 1.4.3p1
 POCO_SOURCE = poco-$(POCO_VERSION)-all.tar.gz
 POCO_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/poco
 POCO_INSTALL_STAGING = YES
