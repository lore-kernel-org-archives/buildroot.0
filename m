From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Jun 2020 21:28:31 +0200
Subject: [Buildroot] [git commit] docs/manual/adding-packages-generic.txt:
 fix typo
Message-ID: <20200606193054.35FCE80764@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31e6e05f7236bea4eba7825c6e78bdd1d41af66b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LIBTOO_SOURCE -> LIBFOO_SOURCE

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-generic.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 568daaeb8d..b8bfcb4aff 100644
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
