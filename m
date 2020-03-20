From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Mar 2020 21:54:54 +0100
Subject: [Buildroot] [git commit] package/samba4: bump version to 4.11.7
Message-ID: <20200320204154.E48C982B2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=98cd8870f8d9c06d1c01bde1f5b623efb9a00b01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://www.samba.org/samba/history/samba-4.11.7.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 022bc22055..8948c41ea6 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.11.6.tar.asc
-sha256 91438f4d7b71f673421435fa7f26b03b613f214139636ce50af35bc2ff09ef38  samba-4.11.6.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.11.7.tar.asc
+sha256 79b6f9ebc357373f885153e2d5d26dc6def9f4511ee4bcbe8a8e2622acc42143  samba-4.11.7.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 3048cb9a63..582b30bcd5 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.11.6
+SAMBA4_VERSION = 4.11.7
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
