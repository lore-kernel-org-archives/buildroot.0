From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 16:29:30 +0200
Subject: [Buildroot] [PATCH 11/19] package/hwdata: add hash
In-Reply-To: <1429453778-4178-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429453778-4178-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429453778-4178-11-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/hwdata/hwdata.hash |    3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/hwdata/hwdata.hash

diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
new file mode 100644
index 0000000..b3c83eb
--- /dev/null
+++ b/package/hwdata/hwdata.hash
@@ -0,0 +1,3 @@
+# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/h/hwdata/hwdata_0.267-1.dsc
+sha256	d77f2b3f3d6e278be669141ffa5dac01b64cab02f7b2c744bbabc500a45263f4	hwdata_0.267.orig.tar.gz
+sha256	055d2f168de9333562a04f6a230c43dc19c4975882935d8b2f0ab17f64f57275	hwdata_0.267-1.diff.gz
-- 
1.7.10.4
