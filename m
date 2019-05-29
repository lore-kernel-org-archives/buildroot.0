From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 28 May 2019 23:35:37 -0400
Subject: [Buildroot] [PATCH 19/19] package/wireless_tools: add hash for
 license file
In-Reply-To: <20190529033537.128311-1-aduskett@gmail.com>
References: <20190529033537.128311-1-aduskett@gmail.com>
Message-ID: <20190529033537.128311-20-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/wireless_tools/wireless_tools.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wireless_tools/wireless_tools.hash b/package/wireless_tools/wireless_tools.hash
index 587c9772ef..50a3f62b84 100644
--- a/package/wireless_tools/wireless_tools.hash
+++ b/package/wireless_tools/wireless_tools.hash
@@ -1,2 +1,3 @@
 # locally computed hash
 sha256 abd9c5c98abf1fdd11892ac2f8a56737544fe101e1be27c6241a564948f34c63 wireless_tools.30.pre9.tar.gz
+sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670 COPYING
-- 
2.21.0
