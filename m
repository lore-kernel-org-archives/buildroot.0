From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Mar 2021 13:41:28 +0100
Subject: [Buildroot] [git commit] package/libseccomp: set
 LIBSECCOMP_CPE_ID_VALID
Message-ID: <20210303122740.A857186DB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04b9f65f11558624a8b99eb0b7d9474689891d3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:libseccomp_project:libseccomp is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibseccomp_project%3Alibseccomp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libseccomp/libseccomp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libseccomp/libseccomp.mk b/package/libseccomp/libseccomp.mk
index cea3d28604..33ef14a3d8 100644
--- a/package/libseccomp/libseccomp.mk
+++ b/package/libseccomp/libseccomp.mk
@@ -8,6 +8,7 @@ LIBSECCOMP_VERSION = 2.4.4
 LIBSECCOMP_SITE = https://github.com/seccomp/libseccomp/releases/download/v$(LIBSECCOMP_VERSION)
 LIBSECCOMP_LICENSE = LGPL-2.1
 LIBSECCOMP_LICENSE_FILES = LICENSE
+LIBSECCOMP_CPE_ID_VALID = YES
 LIBSECCOMP_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
