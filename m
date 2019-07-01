From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon,  1 Jul 2019 18:26:15 -0400
Subject: [Buildroot] [PATCH 03/22] package/libsha1: add license hash
In-Reply-To: <20190701222634.104301-1-aduskett@gmail.com>
References: <20190701222634.104301-1-aduskett@gmail.com>
Message-ID: <20190701222634.104301-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libsha1/libsha1.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libsha1/libsha1.hash b/package/libsha1/libsha1.hash
index 6d597abffb..5a2b0ed138 100644
--- a/package/libsha1/libsha1.hash
+++ b/package/libsha1/libsha1.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 ef4c75007ac41c3dc09e0225943c789ba2b9c632a6cd7b548e0519477ac2f768  libsha1-0.3.tar.gz
+sha256 4c387926596bfeacc5b72ebeb96ab36c299a07568e18592c727a6c11dd512c20  COPYING
-- 
2.21.0
