From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Feb 2017 23:05:10 +0100
Subject: [Buildroot] [git commit] wavpack: properly wrap help text
Message-ID: <20170219220625.6ED5B81E3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=90ef9a24bce917f8d2e9619c1ebeda92633be251
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Wrap help text to fit 72 columns.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wavpack/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/wavpack/Config.in b/package/wavpack/Config.in
index 1ef3e42..db7b893 100644
--- a/package/wavpack/Config.in
+++ b/package/wavpack/Config.in
@@ -2,7 +2,8 @@ config BR2_PACKAGE_WAVPACK
 	bool "wavpack"
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
-	  WavPack is a completely open audio compression format providing
-	  lossless, high-quality lossy, and a unique hybrid compression mode.
+	  WavPack is a completely open audio compression format
+	  providing lossless, high-quality lossy, and a unique
+	  hybrid compression mode.
 
 	  http://www.wavpack.com/
