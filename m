From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 23 Nov 2019 09:46:55 -0800
Subject: [Buildroot] [PATCH 2/2] package/zip: add license hash
In-Reply-To: <20191123174655.299426-1-aduskett@gmail.com>
References: <20191123174655.299426-1-aduskett@gmail.com>
Message-ID: <20191123174655.299426-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/zip/zip.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zip/zip.hash b/package/zip/zip.hash
index 782ae5ec96..5e1b3353a7 100644
--- a/package/zip/zip.hash
+++ b/package/zip/zip.hash
@@ -1,2 +1,3 @@
 # Locally calculated from download (no sig, hash)
 sha256	f0e8bb1f9b7eb0b01285495a2699df3a4b766784c1765a8f1aeedf63c0806369	zip30.tgz
+sha256	8ecd6c1bab449127eb665cef1561e73a8bce52e217375f6f466939e137b1e110	LICENSE
-- 
2.23.0
