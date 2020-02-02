From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun,  2 Feb 2020 20:43:22 +0100
Subject: [Buildroot] [PATCH 32/32] package/z*: add license file hashes
In-Reply-To: <20200202194321.16321-1-heiko.thiery@gmail.com>
References: <20200202194321.16321-1-heiko.thiery@gmail.com>
Message-ID: <20200202194321.16321-33-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/zd1211-firmware/zd1211-firmware.hash | 1 +
 package/zyre/zyre.hash                       | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/zd1211-firmware/zd1211-firmware.hash b/package/zd1211-firmware/zd1211-firmware.hash
index d26858b2dc..2b59b8ac2a 100644
--- a/package/zd1211-firmware/zd1211-firmware.hash
+++ b/package/zd1211-firmware/zd1211-firmware.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  866308f6f59f7075f075d4959dff2ede47735c751251fecd1496df1ba4d338e1  zd1211-firmware-1.4.tar.bz2
+sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/zyre/zyre.hash b/package/zyre/zyre.hash
index 7c934cbe14..289341f494 100644
--- a/package/zyre/zyre.hash
+++ b/package/zyre/zyre.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 b978a999947ddb6722d956db2427869b313225e50518c4fbbf960a68109e3e91 zyre-2.0.0.tar.gz
+sha256  b978a999947ddb6722d956db2427869b313225e50518c4fbbf960a68109e3e91  zyre-2.0.0.tar.gz
+sha256  1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5  LICENSE
-- 
2.20.1
