From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Apr 2015 22:07:41 -0300
Subject: [Buildroot] [PATCH 17/27] xlib_libdmx: add hash file
In-Reply-To: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1428368871-19332-17-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xlib_libdmx/xlib_libdmx.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xlib_libdmx/xlib_libdmx.hash

diff --git a/package/x11r7/xlib_libdmx/xlib_libdmx.hash b/package/x11r7/xlib_libdmx/xlib_libdmx.hash
new file mode 100644
index 0000000..9f71535
--- /dev/null
+++ b/package/x11r7/xlib_libdmx/xlib_libdmx.hash
@@ -0,0 +1,2 @@
+# From http://lists.freedesktop.org/archives/xorg-announce/2013-May/002225.html
+sha256	c97da36d2e56a2d7b6e4f896241785acc95e97eb9557465fd66ba2a155a7b201	libdmx-1.1.3.tar.bz2
-- 
2.0.5
