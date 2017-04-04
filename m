From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Apr 2017 13:01:39 +0200
Subject: [Buildroot] [git commit] gnupg2: bump version to 2.1.20
Message-ID: <20170404110157.C6CC3826EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=32e8a130bf2c087825bb3805b86be280fe2bc828
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnupg2/gnupg2.hash | 6 +++---
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index c589f6a..7eb8e59 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,4 +1,4 @@
-# From https://lists.gnupg.org/pipermail/gnupg-announce/2017q1/000402.html
-sha1 10a088a6716789ac5c5cce2776952d8f4a5c57fc  gnupg-2.1.19.tar.bz2
+# From https://lists.gnupg.org/pipermail/gnupg-announce/2017q2/000404.html
+sha1 500ddae8e4225ae2e300934090f9b9a427b8def1  gnupg-2.1.20.tar.bz2
 # Calculated based on the hash above
-sha256 46cced1f5641ce29cc28250f52fadf6e417e649b3bfdec49a5a0d0b22a639bf0  gnupg-2.1.19.tar.bz2
+sha256 24cf9a69369be64a9f6f8cc11a1be33ab7780ad77a6a1b93719438f49f69960d  gnupg-2.1.20.tar.bz2
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index c310f93..db7f4cb 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.1.19
+GNUPG2_VERSION = 2.1.20
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = ftp://ftp.gnupg.org/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
