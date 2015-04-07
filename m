From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Apr 2015 22:07:47 -0300
Subject: [Buildroot] [PATCH 23/27] xlib_libXScrnSaver: add hash file
In-Reply-To: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1428368871-19332-23-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash

diff --git a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash
new file mode 100644
index 0000000..d5340ba
--- /dev/null
+++ b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash
@@ -0,0 +1,2 @@
+# From http://lists.freedesktop.org/pipermail/xorg/2012-March/054015.html
+sha256	8ff1efa7341c7f34bcf9b17c89648d6325ddaae22e3904e091794e0b4426ce1d	libXScrnSaver-1.2.2.tar.bz2
-- 
2.0.5
