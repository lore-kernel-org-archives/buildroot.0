From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 29 Mar 2015 13:17:56 -0300
Subject: [Buildroot] [PATCH 24/28] x11r7/xproto_dri3proto: add hash file
In-Reply-To: <1427645880-8531-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427645880-8531-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1427645880-8531-24-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xproto_dri3proto/xproto_dri3proto.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xproto_dri3proto/xproto_dri3proto.hash

diff --git a/package/x11r7/xproto_dri3proto/xproto_dri3proto.hash b/package/x11r7/xproto_dri3proto/xproto_dri3proto.hash
new file mode 100644
index 0000000..6e1da4d
--- /dev/null
+++ b/package/x11r7/xproto_dri3proto/xproto_dri3proto.hash
@@ -0,0 +1,2 @@
+# From http://article.gmane.org/gmane.comp.freedesktop.xorg.announce/2079
+sha256	01be49d70200518b9a6b297131f6cc71f4ea2de17436896af153226a774fc074	dri3proto-1.0.tar.bz2
-- 
2.0.5
