From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Sep 2019 19:23:19 +0200
Subject: [Buildroot] [git commit] package/links: bump to version 2.20
Message-ID: <20190913194530.4A25C8E0FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f95580cd3db0ad70ac99099ec43aee3c1d0b402a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/links/links.hash | 2 +-
 package/links/links.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/links/links.hash b/package/links/links.hash
index 190b41f7a2..971ed6308c 100644
--- a/package/links/links.hash
+++ b/package/links/links.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 70758c7dd9bb70f045407900e0a90f1114947fce832c2f9bdefd5c0158089a0a  links-2.19.tar.bz2
+sha256 3bddcd4cb2f7647e50e12a59d1c9bda61076f15cde5f5dca6288b58314e6902d  links-2.20.tar.bz2
diff --git a/package/links/links.mk b/package/links/links.mk
index ad3af6c7ba..f37e1e88c1 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINKS_VERSION = 2.19
+LINKS_VERSION = 2.20
 LINKS_SOURCE = links-$(LINKS_VERSION).tar.bz2
 LINKS_SITE = http://links.twibright.com/download
 LINKS_DEPENDENCIES = host-pkgconf
