From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Apr 2015 22:07:42 -0300
Subject: [Buildroot] [PATCH 18/27] xlib_libfontenc: add hash file
In-Reply-To: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1428368871-19332-18-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xlib_libfontenc/xlib_libfontenc.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xlib_libfontenc/xlib_libfontenc.hash

diff --git a/package/x11r7/xlib_libfontenc/xlib_libfontenc.hash b/package/x11r7/xlib_libfontenc/xlib_libfontenc.hash
new file mode 100644
index 0000000..c8b91b9
--- /dev/null
+++ b/package/x11r7/xlib_libfontenc/xlib_libfontenc.hash
@@ -0,0 +1,2 @@
+# From http://lists.freedesktop.org/archives/xorg/2013-April/055627.html
+sha256	a9a4efed3359b2e80161bb66b65038fac145137fa134e71335264cbc23b02f62	libfontenc-1.1.2.tar.bz2
-- 
2.0.5
