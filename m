From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Oct 2018 15:21:28 +0200
Subject: [Buildroot] [git commit] package/ccrypt: fix download location
Message-ID: <20181006132046.E0DDC8D9BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4230d159201abcfba713974001553c58fc621feb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: David Bachelart <david.bachelart@bbright.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ccrypt/ccrypt.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ccrypt/ccrypt.mk b/package/ccrypt/ccrypt.mk
index d27e34618a..541a0e776d 100644
--- a/package/ccrypt/ccrypt.mk
+++ b/package/ccrypt/ccrypt.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CCRYPT_VERSION = 1.10
-CCRYPT_SITE = http://ccrypt.sourceforge.net/download
+CCRYPT_SITE = http://ccrypt.sourceforge.net/download/$(CCRYPT_VERSION)
 
 CCRYPT_LICENSE = GPL-2.0+
 CCRYPT_LICENSE_FILES = COPYING
