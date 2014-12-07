From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 22:49:09 +0100
Subject: [Buildroot] [git commit] pinentry: bump version to 0.9.0
Message-ID: <20141207215307.EDC62800F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e91645d4064abd929d064ddadc67d49d721e2f90
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump version to 0.9.0
- Add a hash file

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pinentry/pinentry.hash |    2 ++
 package/pinentry/pinentry.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/pinentry/pinentry.hash b/package/pinentry/pinentry.hash
new file mode 100644
index 0000000..851c721
--- /dev/null
+++ b/package/pinentry/pinentry.hash
@@ -0,0 +1,2 @@
+# From https://www.gnupg.org/download/integrity_check.html
+sha1  f8e5c774c35fbb91d84e82559baf76f6b4513236  pinentry-0.9.0.tar.bz2
diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
index 39358a7..56e8e71 100644
--- a/package/pinentry/pinentry.mk
+++ b/package/pinentry/pinentry.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PINENTRY_VERSION = 0.8.3
+PINENTRY_VERSION = 0.9.0
 PINENTRY_SOURCE = pinentry-$(PINENTRY_VERSION).tar.bz2
 PINENTRY_SITE = ftp://ftp.gnupg.org/gcrypt/pinentry
 PINENTRY_LICENSE = GPLv2+
