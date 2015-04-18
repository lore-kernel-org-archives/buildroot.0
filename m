From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Apr 2015 16:29:52 +0200
Subject: [Buildroot] [PATCH 24/61] package/x11r7/xapp_sessreg: add hash
In-Reply-To: <1429367429-11771-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429367429-11771-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429367429-11771-24-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_sessreg/xapp_sessreg.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xapp_sessreg/xapp_sessreg.hash

diff --git a/package/x11r7/xapp_sessreg/xapp_sessreg.hash b/package/x11r7/xapp_sessreg/xapp_sessreg.hash
new file mode 100644
index 0000000..9c1a802
--- /dev/null
+++ b/package/x11r7/xapp_sessreg/xapp_sessreg.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-January/002522.html
+sha256	551177657835e0902b5eee7b19713035beaa1581bbd3c6506baa553e751e017c	sessreg-1.1.0.tar.bz2
-- 
1.7.10.4
