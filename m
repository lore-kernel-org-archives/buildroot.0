From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  2 Jun 2018 18:15:03 +0200
Subject: [Buildroot] [PATCH 1/2] package/mesa3d: fix typo in file hash
Message-ID: <20180602161504.8610-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix typo introduced with the bump to 18.0.4.

Commit f18ca0e7bb0e522846296139cdf0f8039d7dca1c

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/mesa3d/mesa3d.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 9b9f01703c..b6ce272c1c 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -2,7 +2,7 @@
 md5 ef525adaff7f31bedd4c5134bc313da9  mesa-18.0.4.tar.xz
 sha1 4bbee07d8eb42625f215f49d39a657fabdc2f29d  mesa-18.0.4.tar.xz
 sha256 1f3bcfe7cef0a5c20dae2b41df5d7e0a985e06be0183fa4d43b6068fcba2920f  mesa-18.0.4.tar.xz
-sha512 f9a14be46c209661ceb318add1611481445d13b47e95c7a5d2a5e5ecfdd5d2c3fa9c2b16b30035bbb8d61ccc7cb65bfa6698ac8b040273e5ab045a951a67752c  mesa-18.0.3.tar.xz
+sha512 f9a14be46c209661ceb318add1611481445d13b47e95c7a5d2a5e5ecfdd5d2c3fa9c2b16b30035bbb8d61ccc7cb65bfa6698ac8b040273e5ab045a951a67752c  mesa-18.0.4.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
 sha256 a75ee0cec909515ff80a3ec07155b7fb0aafe8051abe1f0e45d5c4c5e2539366  docs/patents.txt
-- 
2.14.3
