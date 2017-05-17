From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 17 May 2017 14:34:51 +0100
Subject: [Buildroot] [PATCH next] gnupg2: bump version to 2.1.21
Message-ID: <20170517133451.43354-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Note to maintainer: you may want to add it to master instead as it
contains mainly bug fixes. See release notes.
https://lists.gnupg.org/pipermail/gnupg-announce/2017q2/000405.html
---
 package/gnupg2/gnupg2.hash | 6 +++---
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index 7eb8e5947..36fa575c7 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,4 +1,4 @@
-# From https://lists.gnupg.org/pipermail/gnupg-announce/2017q2/000404.html
-sha1 500ddae8e4225ae2e300934090f9b9a427b8def1  gnupg-2.1.20.tar.bz2
+# From https://lists.gnupg.org/pipermail/gnupg-announce/2017q2/000405.html
+sha1 1852c066bc21893bc52026ead78edf50fdf15e13  gnupg-2.1.21.tar.bz2
 # Calculated based on the hash above
-sha256 24cf9a69369be64a9f6f8cc11a1be33ab7780ad77a6a1b93719438f49f69960d  gnupg-2.1.20.tar.bz2
+sha256 7aead8a8ba75b69866f583b6c747d91414d523bfdfbe9a8e0fe026b16ba427dd  gnupg-2.1.21.tar.bz2
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index db7f4cbd5..e5451639f 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.1.20
+GNUPG2_VERSION = 2.1.21
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = ftp://ftp.gnupg.org/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
-- 
2.13.0
