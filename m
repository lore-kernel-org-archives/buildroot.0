From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Jun 2017 10:18:33 +0200
Subject: [Buildroot] [PATCH 24/28] package/opkg: add hash
In-Reply-To: <20170611081837.23863-1-bernd.kuhls@t-online.de>
References: <20170611081837.23863-1-bernd.kuhls@t-online.de>
Message-ID: <20170611081837.23863-24-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/opkg/opkg.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/opkg/opkg.hash

diff --git a/package/opkg/opkg.hash b/package/opkg/opkg.hash
new file mode 100644
index 000000000..80f3f0d1d
--- /dev/null
+++ b/package/opkg/opkg.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 2ec7157ccf866e49ca139e3632ba1ca9d61dc24382606b55062e423161a530b0  opkg-v0.3.1.tar.gz
-- 
2.11.0
