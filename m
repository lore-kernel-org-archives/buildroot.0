From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Dec 2020 21:39:48 +0100
Subject: [Buildroot] [git commit] package/samba4: bump version to 4.11.17
Message-ID: <20201205202516.30366838B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fdad5f948dd084e897c114cca5f51a9466d24dfa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://www.samba.org/samba/history/samba-4.11.17.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 45de534ecd..44fbc495c5 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.11.16.tar.asc
-sha256  5a7b1647f2e629b9abfbd880bd01799060663dc0494f8c4d10caa353b5c6e28b  samba-4.11.16.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.11.17.tar.asc
+sha256  15167da19922c7be210ecf8149b73abcb7c2be051de05b756f7f24e7ec9e5b04  samba-4.11.17.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 5874ef32ad..bdf6a30093 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.11.16
+SAMBA4_VERSION = 4.11.17
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
