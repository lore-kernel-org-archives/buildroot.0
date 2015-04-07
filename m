From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Apr 2015 22:07:35 -0300
Subject: [Buildroot] [PATCH 11/27] xlib_libxkbfile: add hash file
In-Reply-To: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1428368871-19332-11-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash

diff --git a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash
new file mode 100644
index 0000000..83431cb
--- /dev/null
+++ b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash
@@ -0,0 +1,2 @@
+# From http://lists.freedesktop.org/pipermail/xorg/2012-March/054011.html
+sha256	8aa94e19c537c43558f30906650cea6e15fa012591445d9f927658c3b32a8f3a	libxkbfile-1.0.8.tar.bz2
-- 
2.0.5
