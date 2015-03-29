From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 29 Mar 2015 13:17:55 -0300
Subject: [Buildroot] [PATCH 23/28] x11r7/xproto_dri2proto: add hash file
In-Reply-To: <1427645880-8531-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427645880-8531-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1427645880-8531-23-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xproto_dri2proto/xproto_dri2proto.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xproto_dri2proto/xproto_dri2proto.hash

diff --git a/package/x11r7/xproto_dri2proto/xproto_dri2proto.hash b/package/x11r7/xproto_dri2proto/xproto_dri2proto.hash
new file mode 100644
index 0000000..e3ea0bc
--- /dev/null
+++ b/package/x11r7/xproto_dri2proto/xproto_dri2proto.hash
@@ -0,0 +1,2 @@
+# From http://article.gmane.org/gmane.comp.freedesktop.xorg.announce/1731
+sha256	f9b55476def44fc7c459b2537d17dbc731e36ed5d416af7ca0b1e2e676f8aa04	dri2proto-2.8.tar.bz2
-- 
2.0.5
