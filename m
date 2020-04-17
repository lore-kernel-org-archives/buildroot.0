From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 17 Apr 2020 16:29:19 -0700
Subject: [Buildroot] [PATCH 1/4] package/openjdk: fix hash
Message-ID: <20200417232922.3762195-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

The hash should be
6815dbac7dd0f86291254e84ed17565c89477eeb6b0847a9648b00ecb4f07634

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/openjdk/openjdk.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index d5be642052..07bf4d5479 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 6815dbac7dd0f86291254e84ed17565c89477eeb6b0847a9648b00ecb4f07634  jdk-14+36.tar.gz
+sha256 fcd13ebd63d40c1c2f3cabfb7bc368962ff7b5935523be2a0e769352987145ae  jdk-14+36.tar.gz
 sha256 4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
-- 
2.25.2
