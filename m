From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 25 Feb 2015 10:07:18 -0300
Subject: [Buildroot] [PATCH 1/5] opus: add hash
Message-ID: <1424869642-9080-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/opus/opus.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/opus/opus.hash

diff --git a/package/opus/opus.hash b/package/opus/opus.hash
new file mode 100644
index 0000000..9c4e34d
--- /dev/null
+++ b/package/opus/opus.hash
@@ -0,0 +1,2 @@
+# From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
+sha256	b9727015a58affcf3db527322bf8c4d2fcf39f5f6b8f15dbceca20206cbe1d95	opus-1.1.tar.gz
-- 
2.0.5
