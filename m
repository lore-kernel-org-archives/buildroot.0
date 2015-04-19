From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 12:53:37 +0200
Subject: [Buildroot] [PATCH 1/5] package/ccid: add hash
Message-ID: <1429440821-2578-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ccid/ccid.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/ccid/ccid.hash

diff --git a/package/ccid/ccid.hash b/package/ccid/ccid.hash
new file mode 100644
index 0000000..a0e91da
--- /dev/null
+++ b/package/ccid/ccid.hash
@@ -0,0 +1,2 @@
+# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/c/ccid/ccid_1.4.18-1.dsc
+sha256	5fdba97a2d2eb1c652b7dd4aa0bb8cee4814bab0cf61aecb84b32b57272541aa	ccid_1.4.18.orig.tar.bz2
-- 
1.7.10.4
