From: Chris Packham <judge.packham@gmail.com>
Date: Mon, 23 Nov 2015 12:25:07 +1300
Subject: [Buildroot] [next PATCH 2/2] micropython-lib: Add hash file
In-Reply-To: <1448234707-1456-1-git-send-email-judge.packham@gmail.com>
References: <1448234707-1456-1-git-send-email-judge.packham@gmail.com>
Message-ID: <1448234707-1456-2-git-send-email-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 package/micropython-lib/micropython-lib.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/micropython-lib/micropython-lib.hash

diff --git a/package/micropython-lib/micropython-lib.hash b/package/micropython-lib/micropython-lib.hash
new file mode 100644
index 0000000..7ab22d5
--- /dev/null
+++ b/package/micropython-lib/micropython-lib.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 f66bfe0e7d2d61119a5def989f74278f42bee7d04162913ea60d3f2955d65909  micropython-lib-v0.5.tar.gz
-- 
2.5.3
