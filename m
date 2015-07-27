From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 27 Jul 2015 20:50:58 +0200
Subject: [Buildroot] [PATCH 07/32] lpeg: add hash file
In-Reply-To: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
References: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1438023083-19010-7-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lpeg/lpeg.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/lpeg/lpeg.hash

diff --git a/package/lpeg/lpeg.hash b/package/lpeg/lpeg.hash
new file mode 100644
index 0000000..1d4e3f4
--- /dev/null
+++ b/package/lpeg/lpeg.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	5df2f09d0cbb67e46176c925e434c0f299ec89060ee97beccfa90375a6f8d3a7  lpeg-0.12.2-1.src.rock
-- 
2.1.4
