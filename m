From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon,  1 Jul 2019 18:26:18 -0400
Subject: [Buildroot] [PATCH 06/22] package/mtools: add license hash
In-Reply-To: <20190701222634.104301-1-aduskett@gmail.com>
References: <20190701222634.104301-1-aduskett@gmail.com>
Message-ID: <20190701222634.104301-6-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/mtools/mtools.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mtools/mtools.hash b/package/mtools/mtools.hash
index 5d86498cdc..0dc172a152 100644
--- a/package/mtools/mtools.hash
+++ b/package/mtools/mtools.hash
@@ -1,2 +1,5 @@
 # Locally calculated after checking pgp signature
 sha256	59e9cf80885399c4f229e5d87e49c0c2bfeec044e1386d59fcd0b0aead6b2f85	mtools-4.0.18.tar.bz2
+
+# Locally calculated
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
-- 
2.21.0
