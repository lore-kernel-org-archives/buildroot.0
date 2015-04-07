From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Apr 2015 22:07:40 -0300
Subject: [Buildroot] [PATCH 16/27] xlib_libXcomposite: add hash file
In-Reply-To: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1428368871-19332-16-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xlib_libXcomposite/xlib_libXcomposite.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xlib_libXcomposite/xlib_libXcomposite.hash

diff --git a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.hash b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.hash
new file mode 100644
index 0000000..b0c3211
--- /dev/null
+++ b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.hash
@@ -0,0 +1,2 @@
+# From http://lists.freedesktop.org/archives/xorg/2013-January/055221.html
+sha256	ede250cd207d8bee4a338265c3007d7a68d5aca791b6ac41af18e9a2aeb34178	libXcomposite-0.4.4.tar.bz2
-- 
2.0.5
