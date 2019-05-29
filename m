From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 28 May 2019 23:35:29 -0400
Subject: [Buildroot] [PATCH 11/19] package/kmod: add hash for license file
In-Reply-To: <20190529033537.128311-1-aduskett@gmail.com>
References: <20190529033537.128311-1-aduskett@gmail.com>
Message-ID: <20190529033537.128311-12-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/kmod/kmod.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/kmod/kmod.hash b/package/kmod/kmod.hash
index 0e8f034e06..f970093cf1 100644
--- a/package/kmod/kmod.hash
+++ b/package/kmod/kmod.hash
@@ -1,2 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kmod/sha256sums.asc
 sha256 7165e6496656159dcb909a91ed708a0fe273a4b128b4b1dc997ccb5189eef1cd  kmod-25.tar.xz
+
+# Locally calculated
+sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  libkmod/COPYING
-- 
2.21.0
