From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jul 2020 08:47:34 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/samba4: bump
 version to 4.11.10
Message-ID: <20200721072318.C7B7086D0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bec65bd9d5964b0e8d651fc4368005e670ef7313
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Changelog:
https://www.samba.org/samba/history/samba-4.11.10.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4e813db5335fe256b44e51b5873f7f417310dce8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index ad34489317..34ae6f84bc 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.11.9.tar.asc
-sha256  ad8cef354cf3f3a8835b04c896906b839270bee763d941db52af037ab5ec8dcc  samba-4.11.9.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.11.10.tar.asc
+sha256  4346ed80c90132a4117fe2dd3e846954f44f006f4d057de3a3544116364e012f  samba-4.11.10.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 4124032264..b6fe1a827c 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.11.9
+SAMBA4_VERSION = 4.11.10
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
