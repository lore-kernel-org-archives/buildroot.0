From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Apr 2015 16:29:55 +0200
Subject: [Buildroot] [PATCH 27/61] package/x11r7/xapp_xauth: add hash
In-Reply-To: <1429367429-11771-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429367429-11771-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429367429-11771-27-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xauth/xapp_xauth.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xapp_xauth/xapp_xauth.hash

diff --git a/package/x11r7/xapp_xauth/xapp_xauth.hash b/package/x11r7/xapp_xauth/xapp_xauth.hash
new file mode 100644
index 0000000..922cecf
--- /dev/null
+++ b/package/x11r7/xapp_xauth/xapp_xauth.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2014-April/002414.html
+sha256	56ce1523eb48b1f8a4f4244fe1c3d8e6af1a3b7d4b0e6063582421b0b68dc28f	xauth-1.0.9.tar.bz2
-- 
1.7.10.4
