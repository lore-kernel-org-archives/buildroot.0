From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Oct 2016 12:36:05 +0200
Subject: [Buildroot] [git commit] package/libamcodec: indentation cleanup
Message-ID: <20161013104050.DEABA81D8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=27186f8738d3f1a735a1efc18a65d6d30e71a208
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libamcodec/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libamcodec/Config.in b/package/libamcodec/Config.in
index 7300259..45846e6 100644
--- a/package/libamcodec/Config.in
+++ b/package/libamcodec/Config.in
@@ -9,6 +9,6 @@ config BR2_PACKAGE_LIBAMCODEC
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	select BR2_PACKAGE_ALSA_LIB
 	help
-	    Interface library for Amlogic media codecs
+	  Interface library for Amlogic media codecs
 
-	    https://github.com/mdrjr/c2_aml_libs.git
+	  https://github.com/mdrjr/c2_aml_libs.git
