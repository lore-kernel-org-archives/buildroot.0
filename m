From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 29 Mar 2015 13:17:48 -0300
Subject: [Buildroot] [PATCH 16/28] x11r7/xproto_kbproto: add hash file
In-Reply-To: <1427645880-8531-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427645880-8531-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1427645880-8531-16-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xproto_kbproto/xproto_kbproto.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xproto_kbproto/xproto_kbproto.hash

diff --git a/package/x11r7/xproto_kbproto/xproto_kbproto.hash b/package/x11r7/xproto_kbproto/xproto_kbproto.hash
new file mode 100644
index 0000000..07a9b3c
--- /dev/null
+++ b/package/x11r7/xproto_kbproto/xproto_kbproto.hash
@@ -0,0 +1,2 @@
+# From http://www.x.org/archive/current/src/everything/CHECKSUMS
+sha256	037cac0aeb80c4fccf44bf736d791fccb2ff7fd34c558ef8f03ac60b61085479	kbproto-1.0.6.tar.bz2
-- 
2.0.5
