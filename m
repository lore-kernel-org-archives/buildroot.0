From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Apr 2015 16:30:29 +0200
Subject: [Buildroot] [PATCH 61/61] package/x11r7/xkeyboard-config: add hash
In-Reply-To: <1429367429-11771-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429367429-11771-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429367429-11771-61-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xkeyboard-config/xkeyboard-config.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xkeyboard-config/xkeyboard-config.hash

diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.hash b/package/x11r7/xkeyboard-config/xkeyboard-config.hash
new file mode 100644
index 0000000..68213a6
--- /dev/null
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-January/002527.html
+sha256	dc91458a214c56a35727f9e523fc647615de64137057ca6ee4d4d4474a4bb2ae	xkeyboard-config-2.14.tar.bz2
-- 
1.7.10.4
