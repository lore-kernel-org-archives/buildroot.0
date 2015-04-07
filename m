From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Apr 2015 22:07:44 -0300
Subject: [Buildroot] [PATCH 20/27] xlib_libXdamage: add hash file
In-Reply-To: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1428368871-19332-20-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xlib_libXdamage/xlib_libXdamage.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xlib_libXdamage/xlib_libXdamage.hash

diff --git a/package/x11r7/xlib_libXdamage/xlib_libXdamage.hash b/package/x11r7/xlib_libXdamage/xlib_libXdamage.hash
new file mode 100644
index 0000000..343cbf4
--- /dev/null
+++ b/package/x11r7/xlib_libXdamage/xlib_libXdamage.hash
@@ -0,0 +1,2 @@
+# From http://lists.freedesktop.org/archives/xorg/2013-January/055220.html
+sha256	7c3fe7c657e83547f4822bfde30a90d84524efb56365448768409b77f05355ad	libXdamage-1.1.4.tar.bz2
-- 
2.0.5
