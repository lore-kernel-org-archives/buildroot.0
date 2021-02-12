From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 12 Feb 2021 23:14:47 +0100
Subject: [Buildroot] [git commit] package/file: set FILE_CPE_ID_VALID
Message-ID: <20210212215339.F064A83D21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c98cec70660914c0089305e22aa676a76e9a7aa6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:file_project:file is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Afile_project%3Afile

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/file/file.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/file/file.mk b/package/file/file.mk
index 42f9524ed1..fa7daa8e07 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -12,6 +12,7 @@ FILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 FILE_INSTALL_STAGING = YES
 FILE_LICENSE = BSD-2-Clause, BSD-4-Clause (one file), BSD-3-Clause (one file)
 FILE_LICENSE_FILES = COPYING src/mygetopt.h src/vasprintf.c
+FILE_CPE_ID_VALID = YES
 # We're patching configure.ac
 FILE_AUTORECONF = YES
 HOST_FILE_CONF_OPTS = --disable-libseccomp
