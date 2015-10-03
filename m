From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Oct 2015 15:28:04 +0200
Subject: [Buildroot] [git commit] links: bump to version 2.12
Message-ID: <20151003132848.0D0DF7FD52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aba0f80d899b99627795d555ae821c50a45c545f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And also use the .tar.bz2 tarball to save disk space and bandwidth.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/links/links.hash |    2 +-
 package/links/links.mk   |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/links/links.hash b/package/links/links.hash
index 910bb69..2d9a7b3 100644
--- a/package/links/links.hash
+++ b/package/links/links.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	e2d4e193eb3147f0d745e28d37d510edb22697707e329cbe361bb79037bae332	links-2.9.tar.gz
+sha256 98411811ded1e8028f5aed708dd7d8ec0ae63ce24c2991a0241a989b7d09d84e  links-2.12.tar.bz2
diff --git a/package/links/links.mk b/package/links/links.mk
index 3b9f011..ba55061 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-LINKS_VERSION = 2.9
+LINKS_VERSION = 2.12
+LINKS_SOURCE = links-$(LINKS_VERSION).tar.bz2
 LINKS_SITE = http://links.twibright.com/download
 LINKS_DEPENDENCIES = host-pkgconf
 LINKS_LICENSE = GPLv2+
