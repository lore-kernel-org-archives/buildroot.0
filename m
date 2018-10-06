From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  6 Oct 2018 14:22:17 +0200
Subject: [Buildroot] [PATCH] package/ccrypt: fix download loacation
Message-ID: <20181006122217.25588-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: David Bachelart <david.bachelart@bbright.com>

---
Note: there is a newer release, 1.11, but I have no way to test it.
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
-- 
2.14.1
