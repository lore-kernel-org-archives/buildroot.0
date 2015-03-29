From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 29 Mar 2015 13:17:36 -0300
Subject: [Buildroot] [PATCH 04/28] x11r7/xproto_xf86driproto: add hash file
In-Reply-To: <1427645880-8531-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427645880-8531-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1427645880-8531-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xproto_xf86driproto/xproto_xf86driproto.hash | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/x11r7/xproto_xf86driproto/xproto_xf86driproto.hash

diff --git a/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.hash b/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.hash
new file mode 100644
index 0000000..85d4bfc
--- /dev/null
+++ b/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.hash
@@ -0,0 +1,3 @@
+# From http://article.gmane.org/gmane.comp.freedesktop.xorg.announce/1310
+md5	1d716d0dac3b664e5ee20c69d34bc10e	xf86driproto-2.1.1.tar.bz2
+sha1	23e861f40ba0f0cbbfd7db7ba2ef623762ffca17	xf86driproto-2.1.1.tar.bz2
-- 
2.0.5
