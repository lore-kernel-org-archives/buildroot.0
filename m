From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 29 Mar 2015 13:17:39 -0300
Subject: [Buildroot] [PATCH 07/28] x11r7/xproto_xextproto: add hash file
In-Reply-To: <1427645880-8531-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427645880-8531-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1427645880-8531-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xproto_xextproto/xproto_xextproto.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xproto_xextproto/xproto_xextproto.hash

diff --git a/package/x11r7/xproto_xextproto/xproto_xextproto.hash b/package/x11r7/xproto_xextproto/xproto_xextproto.hash
new file mode 100644
index 0000000..258c4ec
--- /dev/null
+++ b/package/x11r7/xproto_xextproto/xproto_xextproto.hash
@@ -0,0 +1,2 @@
+# From http://lists.freedesktop.org/pipermail/xorg/2013-December/056256.html
+sha256	f3f4b23ac8db9c3a9e0d8edb591713f3d70ef9c3b175970dd8823dfc92aa5bb0	xextproto-7.3.0.tar.bz2
-- 
2.0.5
