From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:22 -0300
Subject: [Buildroot] [PATCH 021/113] iozone: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-21-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iozone/iozone.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/iozone/iozone.hash

diff --git a/package/iozone/iozone.hash b/package/iozone/iozone.hash
new file mode 100644
index 0000000..8d05382
--- /dev/null
+++ b/package/iozone/iozone.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	e8388238326dc29359e5cb9f790d193f1e1bdadfbf260e010c50fa682387faed	iozone3_430.tar
-- 
2.3.6
