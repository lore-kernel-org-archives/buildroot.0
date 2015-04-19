From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 12:53:38 +0200
Subject: [Buildroot] [PATCH 2/5] package/cdrkit: add hash
In-Reply-To: <1429440821-2578-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429440821-2578-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429440821-2578-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/cdrkit/cdrkit.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/cdrkit/cdrkit.hash

diff --git a/package/cdrkit/cdrkit.hash b/package/cdrkit/cdrkit.hash
new file mode 100644
index 0000000..6ecb922
--- /dev/null
+++ b/package/cdrkit/cdrkit.hash
@@ -0,0 +1,2 @@
+# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/c/cdrkit/cdrkit_1.1.11-3.dsc
+sha256	d1c030756ecc182defee9fe885638c1785d35a2c2a297b4604c0e0dcc78e47da	cdrkit_1.1.11.orig.tar.gz
-- 
1.7.10.4
