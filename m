From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 17 Sep 2014 11:20:03 -0300
Subject: [Buildroot] [PATCH 05/11] iw: add hash
In-Reply-To: <1410963609-18128-1-git-send-email-gustavo@zacarias.com.ar>
References: <1410963609-18128-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1410963609-18128-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iw/iw.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/iw/iw.hash

diff --git a/package/iw/iw.hash b/package/iw/iw.hash
new file mode 100644
index 0000000..a635646
--- /dev/null
+++ b/package/iw/iw.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/software/network/iw/sha256sums.asc
+sha256	bd5c0a92cea799e22bcf431dfe0f91a3ba293ce078e9d95e53d7dbb26df24b8a	iw-3.15.tar.xz
-- 
1.8.5.5
