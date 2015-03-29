From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 29 Mar 2015 13:17:46 -0300
Subject: [Buildroot] [PATCH 14/28] x11r7/xproto_recordproto: add hash file
In-Reply-To: <1427645880-8531-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427645880-8531-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1427645880-8531-14-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xproto_recordproto/xproto_recordproto.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xproto_recordproto/xproto_recordproto.hash

diff --git a/package/x11r7/xproto_recordproto/xproto_recordproto.hash b/package/x11r7/xproto_recordproto/xproto_recordproto.hash
new file mode 100644
index 0000000..bc03f8c
--- /dev/null
+++ b/package/x11r7/xproto_recordproto/xproto_recordproto.hash
@@ -0,0 +1,2 @@
+# From http://www.x.org/archive/current/src/everything/CHECKSUMS
+sha256	a777548d2e92aa259f1528de3c4a36d15e07a4650d0976573a8e2ff5437e7370	recordproto-1.14.2.tar.bz2
-- 
2.0.5
