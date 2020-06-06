From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  6 Jun 2020 14:36:38 +0200
Subject: [Buildroot] [PATCH 1/1] docs/manual/adding-packages-generic.txt:
 fix typo
Message-ID: <20200606123638.2747300-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LIBTOO_SOURCE -> LIBFOO_SOURCE

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.26.2
