From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 13 Apr 2020 20:19:12 +0300
Subject: [Buildroot] [PATCH 1/2] package/skalibs: bump to version 2.9.2.1
Message-ID: <020235cf3f45c498c2d5ce483d8efef08a9a1709.1586798353.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update license hash; copyright year update.

Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/skalibs/skalibs.hash | 4 ++--
 package/skalibs/skalibs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/skalibs/skalibs.hash b/package/skalibs/skalibs.hash
index bb5a60212f90..9d9505ed1095 100644
--- a/package/skalibs/skalibs.hash
+++ b/package/skalibs/skalibs.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 d3b204afc462b9659e0c16f6df1c796e7612534f537eec053529f67ddcd086a5  skalibs-2.9.1.0.tar.gz
-sha256 d8e17a6418d26867c13801810903a1f78beac8cfe8f92c2a85afe59f3c3fc48c  COPYING
+sha256  250b99b53dd413172db944b31c1b930aa145ac79fe6c5d7e6869ef804228c539  skalibs-2.9.2.1.tar.gz
+sha256  5443ac67e8d74ac614ced7bc64211ce90ccedb7778a68bfe9e68a8b234c9503e  COPYING
diff --git a/package/skalibs/skalibs.mk b/package/skalibs/skalibs.mk
index 8b995f796161..1c73f26fe777 100644
--- a/package/skalibs/skalibs.mk
+++ b/package/skalibs/skalibs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SKALIBS_VERSION = 2.9.1.0
+SKALIBS_VERSION = 2.9.2.1
 SKALIBS_SITE = http://skarnet.org/software/skalibs
 SKALIBS_LICENSE = ISC
 SKALIBS_LICENSE_FILES = COPYING
-- 
2.25.1
