From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Jan 2021 21:37:18 +0100
Subject: [Buildroot] [git commit] docs/manual: replace LIBFOO_CPE_ID_PRODUCT
Message-ID: <20210111201854.52E5B8640E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff13cb94144cf2db3d019a32b82cbfa2168e4712
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace LIBFOO_CPE_ID_PRODUCT by LIBFOO_CPE_ID_NAME

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-generic.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 21fedd8b6b..e1d2a464de 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -515,7 +515,7 @@ LIBFOO_IGNORE_CVES += CVE-2020-54321
    identifier. When not defined, the default value is
    +<pkgname>_project+.
 
-** +LIBFOO_CPE_ID_PRODUCT+, specifies the product part of the CPE
+** +LIBFOO_CPE_ID_NAME+, specifies the product part of the CPE
    identifier. When not defined, the default value is +<pkgname>+.
 
 ** +LIBFOO_CPE_ID_VERSION+, specifies the version part of the CPE
@@ -533,9 +533,9 @@ package infrastructure will define +LIBFOO_CPE_ID+.
 +
 Alternatively, a package can also explicitly set +LIBFOO_CPE_ID_VALID
 = YES+ if the default values for +LIBFOO_CPE_ID_PREFIX+,
-+LIBFOO_CPE_ID_VENDOR+, +LIBFOO_CPE_ID_PRODUCT+,
-+LIBFOO_CPE_ID_VERSION+, +LIBFOO_CPE_ID_VERSION_MINOR+ are all correct
-for this package and don't need to be explicitly overridden.
++LIBFOO_CPE_ID_VENDOR+, +LIBFOO_CPE_ID_NAME+, +LIBFOO_CPE_ID_VERSION+,
++LIBFOO_CPE_ID_VERSION_MINOR+ are all correct for this package and
+don't need to be explicitly overridden.
 +
 For a host package, if its +LIBFOO_CPE_ID_*+ variables are not
 defined, it inherits the value of those variables from the
