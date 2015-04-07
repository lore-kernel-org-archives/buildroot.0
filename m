From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Apr 2015 22:07:36 -0300
Subject: [Buildroot] [PATCH 12/27] xlib_libICE: add hash file
In-Reply-To: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1428368871-19332-12-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xlib_libICE/xlib_libICE.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xlib_libICE/xlib_libICE.hash

diff --git a/package/x11r7/xlib_libICE/xlib_libICE.hash b/package/x11r7/xlib_libICE/xlib_libICE.hash
new file mode 100644
index 0000000..1b006ce
--- /dev/null
+++ b/package/x11r7/xlib_libICE/xlib_libICE.hash
@@ -0,0 +1,2 @@
+# From http://lists.freedesktop.org/pipermail/xorg/2014-June/056671.html
+sha256	8f7032f2c1c64352b5423f6b48a8ebdc339cc63064af34d66a6c9aa79759e202	libICE-1.0.9.tar.bz2
-- 
2.0.5
