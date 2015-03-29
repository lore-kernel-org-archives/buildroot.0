From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 29 Mar 2015 13:17:49 -0300
Subject: [Buildroot] [PATCH 17/28] x11r7/xproto_inputproto: add hash file
In-Reply-To: <1427645880-8531-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427645880-8531-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1427645880-8531-17-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xproto_inputproto/xproto_inputproto.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xproto_inputproto/xproto_inputproto.hash

diff --git a/package/x11r7/xproto_inputproto/xproto_inputproto.hash b/package/x11r7/xproto_inputproto/xproto_inputproto.hash
new file mode 100644
index 0000000..426e66f
--- /dev/null
+++ b/package/x11r7/xproto_inputproto/xproto_inputproto.hash
@@ -0,0 +1,2 @@
+# From http://article.gmane.org/gmane.comp.freedesktop.xorg.announce/2167
+sha256	5a47ee62053a6acef3a83f506312494be1461068d0b9269d818839703b95c1d1	inputproto-2.3.1.tar.bz2
-- 
2.0.5
