From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 29 Mar 2015 13:17:53 -0300
Subject: [Buildroot] [PATCH 21/28] x11r7/xproto_damageproto: add hash file
In-Reply-To: <1427645880-8531-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427645880-8531-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1427645880-8531-21-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xproto_damageproto/xproto_damageproto.hash | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/x11r7/xproto_damageproto/xproto_damageproto.hash

diff --git a/package/x11r7/xproto_damageproto/xproto_damageproto.hash b/package/x11r7/xproto_damageproto/xproto_damageproto.hash
new file mode 100644
index 0000000..e5064b6
--- /dev/null
+++ b/package/x11r7/xproto_damageproto/xproto_damageproto.hash
@@ -0,0 +1,3 @@
+# From http://article.gmane.org/gmane.comp.freedesktop.xorg.announce/1194
+md5	998e5904764b82642cc63d97b4ba9e95	damageproto-1.2.1.tar.bz2
+sha1	bd0f0f4dc8f37eaabd9279d10fe2889710507358	damageproto-1.2.1.tar.bz2
-- 
2.0.5
