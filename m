From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 27 Jul 2015 20:51:19 +0200
Subject: [Buildroot] [PATCH 28/32] lunit: add hash file
In-Reply-To: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
References: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1438023083-19010-28-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lunit/lunit.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/lunit/lunit.hash

diff --git a/package/lunit/lunit.hash b/package/lunit/lunit.hash
new file mode 100644
index 0000000..9c8d53c
--- /dev/null
+++ b/package/lunit/lunit.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	b19854c685337ddcec2fe9c22113d2cd14715d52ccd2676abe2fa49b61a2ec4d  lunit-0.5-2.src.rock
-- 
2.1.4
