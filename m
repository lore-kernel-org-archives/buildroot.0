From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 17:42:29 +0200
Subject: [Buildroot] [PATCH 3/5] package/libaio: add hash
In-Reply-To: <1429458151-20049-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429458151-20049-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429458151-20049-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libaio/libaio.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libaio/libaio.hash

diff --git a/package/libaio/libaio.hash b/package/libaio/libaio.hash
new file mode 100644
index 0000000..deb16e8
--- /dev/null
+++ b/package/libaio/libaio.hash
@@ -0,0 +1,2 @@
+# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/liba/libaio/libaio_0.3.109-3.dsc
+sha256	bf4a457253cbaab215aea75cb6e18dc8d95bbd507e9920661ff9bdd288c8778d	libaio_0.3.109.orig.tar.gz
-- 
1.7.10.4
