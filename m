From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Apr 2015 16:30:20 +0200
Subject: [Buildroot] [PATCH 52/61] package/x11r7/xapp_xsetroot: add hash
In-Reply-To: <1429367429-11771-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429367429-11771-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429367429-11771-52-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xsetroot/xapp_xsetroot.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xapp_xsetroot/xapp_xsetroot.hash

diff --git a/package/x11r7/xapp_xsetroot/xapp_xsetroot.hash b/package/x11r7/xapp_xsetroot/xapp_xsetroot.hash
new file mode 100644
index 0000000..89a1abe
--- /dev/null
+++ b/package/x11r7/xapp_xsetroot/xapp_xsetroot.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2013-January/002149.html
+sha256	ba215daaa78c415fce11b9e58c365d03bb602eaa5ea916578d76861a468cc3d9	xsetroot-1.1.1.tar.bz2
-- 
1.7.10.4
