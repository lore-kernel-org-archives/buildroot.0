From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 12 Jun 2013 22:29:18 +0200
Subject: [Buildroot] [git commit] gzip: bump to version 1.6
Message-ID: <20130612203718.A41E29AD48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0396ef14403ca5ef25de42da6ac99470cbdefc27
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gzip/gzip.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
index 5ece73a..fd06bbc 100644
--- a/package/gzip/gzip.mk
+++ b/package/gzip/gzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GZIP_VERSION = 1.5
+GZIP_VERSION = 1.6
 GZIP_SITE = $(BR2_GNU_MIRROR)/gzip
 GZIP_LICENSE = GPLv3+
 GZIP_LICENSE_FILES = COPYING
