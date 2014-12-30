From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 30 Dec 2014 13:52:37 +0200
Subject: [Buildroot] [PATCH] links: bump to version 2.9
Message-ID: <98b448887da6d85900f5d1700a3ecc26e9b30b68.1419940357.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/d95/d95daf56e23944d0b24d38dab949a196a89efcf3/
http://autobuild.buildroot.net/results/f40/f407067f6504b7e4eaf6001828c5d073a21ccd96/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/links/links.hash | 2 +-
 package/links/links.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/links/links.hash b/package/links/links.hash
index a6e79b351100..910bb69d2fc2 100644
--- a/package/links/links.hash
+++ b/package/links/links.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	5070a759af7f107ca4f9572833b8f086cd9f7c21ef5e1fce8482a2883a743c7a	links-2.8.tar.gz
+sha256	e2d4e193eb3147f0d745e28d37d510edb22697707e329cbe361bb79037bae332	links-2.9.tar.gz
diff --git a/package/links/links.mk b/package/links/links.mk
index 2ad56f95745e..3b9f011a4ac1 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINKS_VERSION = 2.8
+LINKS_VERSION = 2.9
 LINKS_SITE = http://links.twibright.com/download
 LINKS_DEPENDENCIES = host-pkgconf
 LINKS_LICENSE = GPLv2+
-- 
2.1.4
