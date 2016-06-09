From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jun 2016 00:13:29 +0200
Subject: [Buildroot] [git commit] wget: security bump to version 1.18
Message-ID: <20160609221335.8645380AEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ed645f343027dade300c9f123f9af607ff62590
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2016-4971 - By default, on server redirects to a FTP resource, use
the original URL to get the local file name.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wget/wget.hash | 2 +-
 package/wget/wget.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wget/wget.hash b/package/wget/wget.hash
index 159cd51..6d26723 100644
--- a/package/wget/wget.hash
+++ b/package/wget/wget.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256  fe559b61eb9cc01635ac6206a14e02cb51591838c35fa83c7a4aacae0bdd97c9  wget-1.17.1.tar.xz
+sha256  b5b55b75726c04c06fe253daec9329a6f1a3c0c1878e3ea76ebfebc139ea9cc1  wget-1.18.tar.xz
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 2c6ccf2..9cda76b 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WGET_VERSION = 1.17.1
+WGET_VERSION = 1.18
 WGET_SOURCE = wget-$(WGET_VERSION).tar.xz
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
 WGET_DEPENDENCIES = host-pkgconf
