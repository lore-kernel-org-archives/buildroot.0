From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 15 Mar 2015 12:19:12 +0100
Subject: [Buildroot] [PATCH 03/14] package/libpciaccess: add hash
In-Reply-To: <1426418363-22738-1-git-send-email-bernd.kuhls@t-online.de>
References: <1426418363-22738-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1426418363-22738-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libpciaccess/libpciaccess.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libpciaccess/libpciaccess.hash

diff --git a/package/libpciaccess/libpciaccess.hash b/package/libpciaccess/libpciaccess.hash
new file mode 100644
index 0000000..10efd1c
--- /dev/null
+++ b/package/libpciaccess/libpciaccess.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-February/002528.html
+sha256	6cd76ccae4e06eee47d3ead84a118740e9406e2a9b7adc9b08e92c69ce89c2e3	libpciaccess-0.13.3.tar.bz2
-- 
1.7.10.4
