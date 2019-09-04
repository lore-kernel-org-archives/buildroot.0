From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  4 Sep 2019 19:58:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/samba4: security bump version to
 4.10.8
Message-ID: <20190904175848.25240-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://www.samba.org/samba/history/samba-4.10.8.html

Fixes CVE-2019-10197
 Combination of parameters and permissions can allow user
 to escape from the share path definition.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index fbc680cb32..7d41ad8fbf 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.10.7.tar.asc
-sha256 34f30494b6b63700f54be22be636e8a6e0430577166a76a017075e11c02a1ebb  samba-4.10.7.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.10.8.tar.asc
+sha256 c41f05fb567f7359998b451543501c7690a2bf6551d658a76bd6916316a410f4  samba-4.10.8.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 1d097f1d48..172bdb3b8f 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.10.7
+SAMBA4_VERSION = 4.10.8
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.20.1
