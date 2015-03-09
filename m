From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Mar 2015 14:05:18 +0100
Subject: [Buildroot] [git commit] wget: bump to version 1.16.3
Message-ID: <20150309130534.DB10F803D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c3df14db89d8ce14a9f1181d572b11cc572d3d1f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a regression of quiet mode not being quiet.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wget/wget.hash |    2 +-
 package/wget/wget.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wget/wget.hash b/package/wget/wget.hash
index dffed4e..faab805 100644
--- a/package/wget/wget.hash
+++ b/package/wget/wget.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256  a7dfde1bcb0eb135addf587a649fd0e47c1a876edef359b9197cdffd1fdcd7d5  wget-1.16.2.tar.xz
+sha256  67f7b7b0f5c14db633e3b18f53172786c001e153d545cfc85d82759c5c2ffb37  wget-1.16.3.tar.xz
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 382cdf7..742d81e 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WGET_VERSION = 1.16.2
+WGET_VERSION = 1.16.3
 WGET_SOURCE = wget-$(WGET_VERSION).tar.xz
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
 WGET_DEPENDENCIES = host-pkgconf
