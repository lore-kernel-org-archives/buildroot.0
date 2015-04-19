From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 19:13:58 +0200
Subject: [Buildroot] [PATCH 05/10] package/mii-diag: add hash
In-Reply-To: <1429463643-27125-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429463643-27125-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429463643-27125-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mii-diag/mii-diag.hash |    3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/mii-diag/mii-diag.hash

diff --git a/package/mii-diag/mii-diag.hash b/package/mii-diag/mii-diag.hash
new file mode 100644
index 0000000..22c69e3
--- /dev/null
+++ b/package/mii-diag/mii-diag.hash
@@ -0,0 +1,3 @@
+# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/m/mii-diag/mii-diag_2.11-3.dsc
+sha256	c690e87e6010607593c1cc2ccd5c481eb3be179387220ad445d8ab83d73ad41c	mii-diag_2.11.orig.tar.gz
+sha256	b49fd3e7c0c446a949c3ca246cc441824d7ef5a61530f884756a82b0b2997190	mii-diag_2.11-3.diff.gz
-- 
1.7.10.4
