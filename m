From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Jan 2019 21:22:02 +0100
Subject: [Buildroot] [git commit] whois: bump to version 5.4.0
Message-ID: <20190115202334.24C8F8D3C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f6e4733aa775c8fb3a1131210cc184a9d9850158
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/whois/whois.hash | 4 ++--
 package/whois/whois.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/whois/whois.hash b/package/whois/whois.hash
index 4fdfebce0f..41ef935c1d 100644
--- a/package/whois/whois.hash
+++ b/package/whois/whois.hash
@@ -1,5 +1,5 @@
-# From http://snapshot.debian.org/archive/debian/20180715T153200Z/pool/main/w/whois/whois_5.3.2.dsc
-sha256	79714ba89172bca08a2443f59885daa4af0c5f8d6a49bc9e7f2a83559a286354	whois_5.3.2.tar.xz
+# From http://snapshot.debian.org/archive/debian/20181026T220636Z/pool/main/w/whois/whois_5.4.0.dsc
+sha256	3775ae0cfaa6dd8d886e5233c4826225cddcb88c99c2a08130d14e15fe58e378	whois_5.4.0.tar.xz
 
 # Hash for license file:
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index c162f1cf38..712ad911d8 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WHOIS_VERSION = 5.3.2
-WHOIS_SITE = http://snapshot.debian.org/archive/debian/20180715T153200Z/pool/main/w/whois
+WHOIS_VERSION = 5.4.0
+WHOIS_SITE = http://snapshot.debian.org/archive/debian/20181026T220636Z/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 WHOIS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 WHOIS_MAKE_ENV = $(TARGET_MAKE_ENV)
