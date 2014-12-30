From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Dec 2014 23:35:19 +0100
Subject: [Buildroot] [git commit] links: bump to version 2.9
Message-ID: <20141230223526.BB4A3807CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=078a2600e41830ef804b239ca2c11041ab9fc2fa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/d95/d95daf56e23944d0b24d38dab949a196a89efcf3/
http://autobuild.buildroot.net/results/f40/f407067f6504b7e4eaf6001828c5d073a21ccd96/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/links/links.hash |    2 +-
 package/links/links.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/links/links.hash b/package/links/links.hash
index a6e79b3..910bb69 100644
--- a/package/links/links.hash
+++ b/package/links/links.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	5070a759af7f107ca4f9572833b8f086cd9f7c21ef5e1fce8482a2883a743c7a	links-2.8.tar.gz
+sha256	e2d4e193eb3147f0d745e28d37d510edb22697707e329cbe361bb79037bae332	links-2.9.tar.gz
diff --git a/package/links/links.mk b/package/links/links.mk
index 2ad56f9..3b9f011 100644
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
