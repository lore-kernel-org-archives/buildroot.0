From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 19 Mar 2015 14:29:46 -0300
Subject: [Buildroot] [PATCH] gpsd: add hash file
Message-ID: <1426786186-12621-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gpsd/gpsd.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/gpsd/gpsd.hash

diff --git a/package/gpsd/gpsd.hash b/package/gpsd/gpsd.hash
new file mode 100644
index 0000000..80703c1
--- /dev/null
+++ b/package/gpsd/gpsd.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	ed66c6b6b1e2b4951de2c0b2399c22f77fe9f5927ef6b948dd8eb023ff53b7ee	gpsd-3.11.tar.gz
-- 
2.0.5
