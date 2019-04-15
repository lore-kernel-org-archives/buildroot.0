From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 15 Apr 2019 14:15:16 -0400
Subject: [Buildroot] [PATCH 3/4] package/ninja: Add hash for license files
In-Reply-To: <20190415181517.83400-1-aduskett@gmail.com>
References: <20190415181517.83400-1-aduskett@gmail.com>
Message-ID: <20190415181517.83400-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/ninja/ninja.hash | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/ninja/ninja.hash b/package/ninja/ninja.hash
index 3f5bd3a279..cf545b5b70 100644
--- a/package/ninja/ninja.hash
+++ b/package/ninja/ninja.hash
@@ -1,2 +1,3 @@
 # Locally generated
-sha256 5d7ec75828f8d3fd1a0c2f31b5b0cea780cdfe1031359228c428c1a48bfcd5b9 ninja-v1.9.0.tar.gz
+sha256	5d7ec75828f8d3fd1a0c2f31b5b0cea780cdfe1031359228c428c1a48bfcd5b9	ninja-v1.9.0.tar.gz
+sha256	eb7e9ab9690124c5c9f42bdc81383d886a3dede26345b6ed15bbad7caf81f7ea	COPYING
-- 
2.20.1
