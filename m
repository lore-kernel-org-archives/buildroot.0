From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Jun 2016 23:39:59 +0200
Subject: [Buildroot] [PATCH 06/12] package/libshairplay: add hash
In-Reply-To: <1465162805-13367-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465162805-13367-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1465162805-13367-6-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libshairplay/libshairplay.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libshairplay/libshairplay.hash

diff --git a/package/libshairplay/libshairplay.hash b/package/libshairplay/libshairplay.hash
new file mode 100644
index 0000000..19261f9
--- /dev/null
+++ b/package/libshairplay/libshairplay.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 49ac0e0470ec6367f720c7b79a09165138f57b60f5949a2d9c38be5823d13294 libshairplay-ce80e005908f41d0e6fde1c4a21e9cb8ee54007b.tar.gz
-- 
2.8.1
