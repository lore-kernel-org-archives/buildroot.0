From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Jul 2019 08:01:39 +0200
Subject: [Buildroot] [git commit] package/samba4: bump version to 4.9.10
Message-ID: <20190704060335.5D5C48842B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4718b14a77cdd35899c72900e2a4d81a93b8fd0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://www.samba.org/samba/history/samba-4.9.10.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 60c724e4b8..075a1e6f2c 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.9.9.tar.asc
-sha256 af0bf46abc74c62c5a8fe7b567103684b7bf4ce086d32bcd2f6681f592bf63ca  samba-4.9.9.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.9.10.tar.asc
+sha256 f81ab92924b2f3c368ab64a381c1bb2befc7ddc90043dbb10b02d85cca27df61  samba-4.9.10.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 6aaf81bf13..7fe6ec5a2d 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.9.9
+SAMBA4_VERSION = 4.9.10
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
