From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Apr 2015 22:07:29 -0300
Subject: [Buildroot] [PATCH 05/27] libxcb: add hash file
In-Reply-To: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1428368871-19332-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/libxcb/libxcb.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/libxcb/libxcb.hash

diff --git a/package/x11r7/libxcb/libxcb.hash b/package/x11r7/libxcb/libxcb.hash
new file mode 100644
index 0000000..e938a5a
--- /dev/null
+++ b/package/x11r7/libxcb/libxcb.hash
@@ -0,0 +1,2 @@
+# From http://lists.freedesktop.org/pipermail/xorg/2014-August/056793.html
+sha256	03635d70045b9ede90778e67516135828a57de87ac508f987024f43c03620ff7	libxcb-1.11.tar.bz2
-- 
2.0.5
