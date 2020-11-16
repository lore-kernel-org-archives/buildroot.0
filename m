From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Nov 2020 21:07:27 +0100
Subject: [Buildroot] [git commit branch/next] package/samba4: bump version
 to 4.11.16
Message-ID: <20201116195427.CD1FC8108B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aaa21d40b3ee7c74fa19f9c6d74d8a8198e66341
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes: https://www.samba.org/samba/history/samba-4.11.16.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 0ce22a8526..45de534ecd 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.11.15.tar.asc
-sha256  922d461bb2e6e490cf7708b297a9312ea6cda1edc7bdfea4ee665f45ff99038a  samba-4.11.15.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.11.16.tar.asc
+sha256  5a7b1647f2e629b9abfbd880bd01799060663dc0494f8c4d10caa353b5c6e28b  samba-4.11.16.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 51ee2c9c39..5874ef32ad 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.11.15
+SAMBA4_VERSION = 4.11.16
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
