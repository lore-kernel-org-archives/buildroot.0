From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 29 Mar 2015 13:17:47 -0300
Subject: [Buildroot] [PATCH 15/28] x11r7/xproto_presentproto: add hash file
In-Reply-To: <1427645880-8531-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427645880-8531-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1427645880-8531-15-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xproto_presentproto/xproto_presentproto.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xproto_presentproto/xproto_presentproto.hash

diff --git a/package/x11r7/xproto_presentproto/xproto_presentproto.hash b/package/x11r7/xproto_presentproto/xproto_presentproto.hash
new file mode 100644
index 0000000..f947d91
--- /dev/null
+++ b/package/x11r7/xproto_presentproto/xproto_presentproto.hash
@@ -0,0 +1,2 @@
+# From http://article.gmane.org/gmane.comp.freedesktop.xorg.announce/2078
+sha256	812c7d48721f909a0f7a2cb1e91f6eead76159a36c4712f4579ca587552839ce	presentproto-1.0.tar.bz2
-- 
2.0.5
