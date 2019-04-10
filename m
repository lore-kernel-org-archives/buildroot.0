From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 10 Apr 2019 14:32:12 -0400
Subject: [Buildroot] [PATCH 1/1] package/python3: fix hash for license file
Message-ID: <20190410183212.12034-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

The year was updated.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/python3/python3.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 9a7904c1d5..d5209c23cc 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -2,4 +2,4 @@
 md5		93df27aec0cd18d6d42173e601ffbbfd Python-3.7.3.tar.xz
 # Locally computed
 sha256 da60b54064d4cfcd9c26576f6df2690e62085123826cff2e667e72a91952d318 Python-3.7.3.tar.xz
-sha256 b9a6d9320b8f2693e8d41e496ce56caadacaddcca9be2a64a61749278f425cf2 LICENSE
+sha256 a77d71d6be6f9032e6b6e5d2cf6da68f9eeab9036edfbc043633c8979cd5e82c LICENSE
-- 
2.20.1
