From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 22:49:21 +0100
Subject: [Buildroot] [git commit] libgpgme: bump version to 1.5.2
Message-ID: <20141207215308.09524800F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e566581c9d4bda1e70d5ba0166c9d6ea8a50bd90
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump version to 1.5.2
- Add a hash file

[Thomas: fix typo in commit title.]

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgpgme/libgpgme.hash |    2 ++
 package/libgpgme/libgpgme.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/libgpgme/libgpgme.hash b/package/libgpgme/libgpgme.hash
new file mode 100644
index 0000000..fda2e7d
--- /dev/null
+++ b/package/libgpgme/libgpgme.hash
@@ -0,0 +1,2 @@
+# From https://www.gnupg.org/download/integrity_check.html
+sha1  cb550ea09314a362aa895f1ca92da6ba73fb512a  gpgme-1.5.2.tar.bz2
diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index 17271ad..fd25532 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPGME_VERSION = 1.5.1
+LIBGPGME_VERSION = 1.5.2
 LIBGPGME_SITE = ftp://ftp.gnupg.org/gcrypt/gpgme
 LIBGPGME_SOURCE = gpgme-$(LIBGPGME_VERSION).tar.bz2
 LIBGPGME_LICENSE = LGPLv2.1+
