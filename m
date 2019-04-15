From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 15 Apr 2019 14:15:14 -0400
Subject: [Buildroot] [PATCH 1/4] package/autoconf: Add hash for license files
Message-ID: <20190415181517.83400-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/autoconf/autoconf.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/autoconf/autoconf.hash b/package/autoconf/autoconf.hash
index f35f6f8d0a..e607db781c 100644
--- a/package/autoconf/autoconf.hash
+++ b/package/autoconf/autoconf.hash
@@ -1,2 +1,4 @@
 # Locally calculated after checking pgp signature
 sha256	64ebcec9f8ac5b2487125a86a7760d2591ac9e1d3dbd59489633f9de62a57684  autoconf-2.69.tar.xz
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYINGv3
+sha256	23ed0b84fa023bfa33433b498192cd08a3bfb1f4864a8ed791a84f3eb48b2dd2	COPYING.EXCEPTION
-- 
2.20.1
