From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Apr 2015 22:07:45 -0300
Subject: [Buildroot] [PATCH 21/27] xlib_libXdmcp: add hash file
In-Reply-To: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1428368871-19332-21-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.hash

diff --git a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.hash b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.hash
new file mode 100644
index 0000000..8aff93b
--- /dev/null
+++ b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.hash
@@ -0,0 +1,2 @@
+# From http://lists.freedesktop.org/archives/xorg/2012-March/054007.html
+sha256	9ace6d4230f9dce4ed090692f82f613253ada8f887b23b3d8ff3dd4e3a7c118e	libXdmcp-1.1.1.tar.bz2
-- 
2.0.5
