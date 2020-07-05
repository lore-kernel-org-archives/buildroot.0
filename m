From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jul 2020 23:16:28 +0200
Subject: [Buildroot] [git commit branch/2020.02.x]
 docs/manual/adding-packages-generic.txt: fix typo
Message-ID: <20200705211324.AA1D083FE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a23115004d52a4b7d5825f0c962d39049db6ca48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

LIBTOO_SOURCE -> LIBFOO_SOURCE

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 31e6e05f7236bea4eba7825c6e78bdd1d41af66b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-generic.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index ed1e6acf57..f2969e9a13 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -452,7 +452,7 @@ not and can not work as people would expect it should:
   of the manifest file for this package.
 
 * +LIBFOO_ACTUAL_SOURCE_TARBALL+ only applies to packages whose
-  +LIBFOO_SITE+ / +LIBTOO_SOURCE+ pair points to an archive that does
+  +LIBFOO_SITE+ / +LIBFOO_SOURCE+ pair points to an archive that does
   not actually contain source code, but binary code. This a very
   uncommon case, only known to apply to external toolchains which come
   already compiled, although theoretically it might apply to other
