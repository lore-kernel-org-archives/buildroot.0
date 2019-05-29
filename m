From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 28 May 2019 23:35:35 -0400
Subject: [Buildroot] [PATCH 17/19] package/udisks: add hash for license file
In-Reply-To: <20190529033537.128311-1-aduskett@gmail.com>
References: <20190529033537.128311-1-aduskett@gmail.com>
Message-ID: <20190529033537.128311-18-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/udisks/udisks.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/udisks/udisks.hash b/package/udisks/udisks.hash
index 7ad4326b1c..b40161e323 100644
--- a/package/udisks/udisks.hash
+++ b/package/udisks/udisks.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 f2ec82eb0ea7e01dc299b5b29b3c18cdf861236ec43dcff66b3552b4b31c6f71  udisks-1.0.5.tar.gz
+sha256 7d30f41a79a9b453b4972a6d7e3425ff104b39232891bde8ba659f1adb21f771  COPYING
-- 
2.21.0
