From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Mar 2019 22:24:19 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/samba4: security
 bump to version 4.9.5
Message-ID: <20190325212354.95D4F81805@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d482e1521c9be4e1c5d85fbf9a2f23496c10d6d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Release notes: https://www.samba.org/samba/history/samba-4.9.5.html

Fixes CVE-2019-3824:
ldb: Out of bound read in ldb_wildcard_compare

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e7d67faac5be820b1c8019eb249adf8765d4cf42)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index de349c3049..70cea4809b 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.9.4.tar.asc
-sha256 6d98a8d8bcccbe788e4bbb406362e6676311aca711a3f3cc9b3a404bb9ff0b4f  samba-4.9.4.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.9.5.tar.asc
+sha256 078956d2d98e22011265afd4b7221efe4861067dcba4a031583b01f34d423700  samba-4.9.5.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 9f771cf82f..9b226a0e05 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.9.4
+SAMBA4_VERSION = 4.9.5
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
