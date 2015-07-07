From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  7 Jul 2015 09:52:30 -0300
Subject: [Buildroot] [PATCH 2/4] rp-pppoe: add hash file
In-Reply-To: <1436273552-2877-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436273552-2877-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436273552-2877-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/rp-pppoe/rp-pppoe.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/rp-pppoe/rp-pppoe.hash

diff --git a/package/rp-pppoe/rp-pppoe.hash b/package/rp-pppoe/rp-pppoe.hash
new file mode 100644
index 0000000..ab162ee
--- /dev/null
+++ b/package/rp-pppoe/rp-pppoe.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	86a1a4d92fcea74fa6dd45516c5975933fa978b36fafe71f76ea70b4b4747720	rp-pppoe-3.11.tar.gz
-- 
2.3.6
