From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 07:57:03 -0300
Subject: [Buildroot] [PATCH 5/5] mpc: add hash file
In-Reply-To: <1413284223-20630-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413284223-20630-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1413284223-20630-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mpc/mpc.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/mpc/mpc.hash

diff --git a/package/mpc/mpc.hash b/package/mpc/mpc.hash
new file mode 100644
index 0000000..bee59fe
--- /dev/null
+++ b/package/mpc/mpc.hash
@@ -0,0 +1,2 @@
+# From http://www.multiprecision.org/index.php?prog=mpc&page=download
+sha1	5072d82ab50ec36cc8c0e320b5c377adb48abe70	mpc-1.0.2.tar.gz
-- 
2.0.4
