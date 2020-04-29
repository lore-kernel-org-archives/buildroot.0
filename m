From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Apr 2020 22:08:08 +0200
Subject: [Buildroot] [git commit] package/samba4: security bump version to
 4.11.8
Message-ID: <20200429201057.C271B90AB8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=11bc27fd0d48351fbe419220a963d50283a12605
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reformatted hash.

Fixes CVE 2020-10700 & CVE 2020-10704.

Release notes: https://www.samba.org/samba/history/samba-4.11.8.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/samba4/samba4.hash | 6 +++---
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 8948c41ea6..f2ae8b5b58 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.11.7.tar.asc
-sha256 79b6f9ebc357373f885153e2d5d26dc6def9f4511ee4bcbe8a8e2622acc42143  samba-4.11.7.tar.gz
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+# https://download.samba.org/pub/samba/stable/samba-4.11.8.tar.asc
+sha256  bb140caa37d2bbbb1f15f849aa86b1d5f787729443099139936f0ea06a5100ca  samba-4.11.8.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 582b30bcd5..9ec4c1eabe 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.11.7
+SAMBA4_VERSION = 4.11.8
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
