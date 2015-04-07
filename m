From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Apr 2015 22:07:50 -0300
Subject: [Buildroot] [PATCH 26/27] xcb-proto: add hash file
In-Reply-To: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1428368871-19332-26-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xcb-proto/xcb-proto.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xcb-proto/xcb-proto.hash

diff --git a/package/x11r7/xcb-proto/xcb-proto.hash b/package/x11r7/xcb-proto/xcb-proto.hash
new file mode 100644
index 0000000..c9a9108
--- /dev/null
+++ b/package/x11r7/xcb-proto/xcb-proto.hash
@@ -0,0 +1,2 @@
+# From http://lists.freedesktop.org/archives/xcb/2014-August/009614.html
+sha256	b4aceee6502a0ce45fc39b33c541a2df4715d00b72e660ebe8c5bb444771e32e	xcb-proto-1.11.tar.bz2
-- 
2.0.5
