From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 19:14:02 +0200
Subject: [Buildroot] [PATCH 09/10] package/thttpd: add hash
In-Reply-To: <1429463643-27125-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429463643-27125-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429463643-27125-9-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/thttpd/thttpd.hash |    3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/thttpd/thttpd.hash

diff --git a/package/thttpd/thttpd.hash b/package/thttpd/thttpd.hash
new file mode 100644
index 0000000..2400f5b
--- /dev/null
+++ b/package/thttpd/thttpd.hash
@@ -0,0 +1,3 @@
+# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/t/thttpd/thttpd_2.25b-11.dsc
+sha256	07719b08b1cff6a21c08697a7bcb4395425b07ee753106262fb62a03a7d32360	thttpd_2.25b.orig.tar.gz
+sha256	4d213c18daf121d21412cc54864fbca250e1773a91df6573373e1d2273a2cec9	thttpd_2.25b-11.diff.gz
-- 
1.7.10.4
