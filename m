From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:08 -0300
Subject: [Buildroot] [PATCH 067/113] ocrad: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-67-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ocrad/ocrad.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/ocrad/ocrad.hash

diff --git a/package/ocrad/ocrad.hash b/package/ocrad/ocrad.hash
new file mode 100644
index 0000000..c40907b
--- /dev/null
+++ b/package/ocrad/ocrad.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	4ec711239d6b667bac015ef9908cab3ea9f8fd73f098ae355498810c8e82a8cc	ocrad-0.21.tar.gz
-- 
2.3.6
