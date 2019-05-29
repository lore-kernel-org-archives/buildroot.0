From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 28 May 2019 23:35:26 -0400
Subject: [Buildroot] [PATCH 08/19] package/gmp: add hashes for license files
In-Reply-To: <20190529033537.128311-1-aduskett@gmail.com>
References: <20190529033537.128311-1-aduskett@gmail.com>
Message-ID: <20190529033537.128311-9-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/gmp/gmp.hash | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gmp/gmp.hash b/package/gmp/gmp.hash
index f4793cd93c..417b9d17bf 100644
--- a/package/gmp/gmp.hash
+++ b/package/gmp/gmp.hash
@@ -1,2 +1,6 @@
 # Locally calculated after checking pgp signature
 sha256	87b565e89a9a684fe4ebeeddb8399dce2599f9c9049854ca8c0dfbdea0e21912	gmp-6.1.2.tar.xz
+
+# Locally calculated
+sha256	a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c	COPYING.LESSERv3
+sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYINGv2
-- 
2.21.0
