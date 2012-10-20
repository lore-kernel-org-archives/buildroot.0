From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 20 Oct 2012 21:04:07 +0200
Subject: [Buildroot] [git commit] pcre: bump version
Message-ID: <20121020190731.045B599747@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b1570168d86db59a0c9101ca757fc77b909ce3da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alexander Khryukin <alexander@mezon.ru>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pcre/pcre.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index 8fd6b21..9947c4b 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-PCRE_VERSION = 8.30
+PCRE_VERSION = 8.31
 PCRE_SITE = ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre
 PCRE_LICENSE = BSD-3c
 PCRE_LICENSE_FILES = LICENCE
