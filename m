From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Sep 2017 23:47:34 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] file: bump version to 5.31
Message-ID: <20170906214509.96C028169F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fae25a1d216b5b4c1d48c7e6c06f8b87abbc547a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit e173bbe958ef7ef51400fe0c0d9b2deb7d89f7aa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/file/file.hash | 2 +-
 package/file/file.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/file/file.hash b/package/file/file.hash
index 3fafff8..dcf96ec 100644
--- a/package/file/file.hash
+++ b/package/file/file.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 694c2432e5240187524c9e7cf1ec6acc77b47a0e19554d34c14773e43dbbf214  file-5.30.tar.gz
+sha256 09c588dac9cff4baa054f51a36141793bcf64926edc909594111ceae60fce4ee  file-5.31.tar.gz
diff --git a/package/file/file.mk b/package/file/file.mk
index 2fa6804..4b86f80 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FILE_VERSION = 5.30
+FILE_VERSION = 5.31
 FILE_SITE = ftp://ftp.astron.com/pub/file
 FILE_DEPENDENCIES = host-file zlib
 HOST_FILE_DEPENDENCIES = host-zlib
