From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Sep 2019 22:54:53 +0200
Subject: [Buildroot] [git commit branch/2019.08.x] package/samba4: security
 bump version to 4.10.8
Message-ID: <20190904205106.15B558B677@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=832f4d8ae43537f21939e64cb0e60d0a6925b11c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Release notes: https://www.samba.org/samba/history/samba-4.10.8.html

Fixes CVE-2019-10197
 Combination of parameters and permissions can allow user
 to escape from the share path definition.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4e574eaf062627825018eb21defa8854e1820671)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
