From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 29 Mar 2015 13:17:45 -0300
Subject: [Buildroot] [PATCH 13/28] x11r7/xproto_renderproto: add hash file
In-Reply-To: <1427645880-8531-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427645880-8531-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1427645880-8531-13-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xproto_renderproto/xproto_renderproto.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xproto_renderproto/xproto_renderproto.hash

diff --git a/package/x11r7/xproto_renderproto/xproto_renderproto.hash b/package/x11r7/xproto_renderproto/xproto_renderproto.hash
new file mode 100644
index 0000000..92763da
--- /dev/null
+++ b/package/x11r7/xproto_renderproto/xproto_renderproto.hash
@@ -0,0 +1,2 @@
+# From http://www.x.org/archive/current/src/everything/CHECKSUMS
+sha256	06735a5b92b20759204e4751ecd6064a2ad8a6246bb65b3078b862a00def2537	renderproto-0.11.1.tar.bz2
-- 
2.0.5
