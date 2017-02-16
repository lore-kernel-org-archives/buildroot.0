From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 16 Feb 2017 21:41:16 +0100
Subject: [Buildroot] [PATCH 2/2] wavpack: properly wrap help text
In-Reply-To: <20170216204116.2212-1-joerg.krause@embedded.rocks>
References: <20170216204116.2212-1-joerg.krause@embedded.rocks>
Message-ID: <20170216204116.2212-2-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/wavpack/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/wavpack/Config.in b/package/wavpack/Config.in
index 5a27b2e15..59bb416cb 100644
--- a/package/wavpack/Config.in
+++ b/package/wavpack/Config.in
@@ -3,8 +3,9 @@ config BR2_PACKAGE_WAVPACK
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
-	  WavPack is a completely open audio compression format providing
-	  lossless, high-quality lossy, and a unique hybrid compression mode.
+	  WavPack is a completely open audio compression format
+	  providing lossless, high-quality lossy, and a unique
+	  hybrid compression mode.
 
 	  http://www.wavpack.com/
 
-- 
2.11.1
