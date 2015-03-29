From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 29 Mar 2015 13:17:37 -0300
Subject: [Buildroot] [PATCH 05/28] x11r7/xproto_xf86dgaproto: add hash file
In-Reply-To: <1427645880-8531-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427645880-8531-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1427645880-8531-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.hash | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.hash

diff --git a/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.hash b/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.hash
new file mode 100644
index 0000000..36284fc
--- /dev/null
+++ b/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.hash
@@ -0,0 +1,3 @@
+# From http://article.gmane.org/gmane.comp.freedesktop.xorg.announce/817
+md5	a036dc2fcbf052ec10621fd48b68dbb1	xf86dgaproto-2.1.tar.bz2
+sha1	97a06120e7195c968875e8ba42e82c90ab54948b	xf86dgaproto-2.1.tar.bz2
-- 
2.0.5
