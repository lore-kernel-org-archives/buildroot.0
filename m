From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 14:01:33 +0200
Subject: [Buildroot] [PATCH 5/5] package/dmraid: add hash
In-Reply-To: <1429444893-13874-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429444893-13874-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429444893-13874-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dmraid/dmraid.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/dmraid/dmraid.hash

diff --git a/package/dmraid/dmraid.hash b/package/dmraid/dmraid.hash
new file mode 100644
index 0000000..3166921
--- /dev/null
+++ b/package/dmraid/dmraid.hash
@@ -0,0 +1,2 @@
+# From http://people.redhat.com/~heinzm/sw/dmraid/src/dmraid-1.0.0.rc16-3.tar.bz2.md5.sum
+md5	819338fcef98e8e25819f0516722beeb dmraid-1.0.0.rc16-3.tar.bz2
-- 
1.7.10.4
