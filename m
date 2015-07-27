From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 27 Jul 2015 20:50:59 +0200
Subject: [Buildroot] [PATCH 08/32] lpty: add hash file
In-Reply-To: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
References: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1438023083-19010-8-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lpty/lpty.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/lpty/lpty.hash

diff --git a/package/lpty/lpty.hash b/package/lpty/lpty.hash
new file mode 100644
index 0000000..a451fd8
--- /dev/null
+++ b/package/lpty/lpty.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	cf263ece9b50a78a7fb2277e3546fbbf0bf6858f41821932d92f2e3d8a065091  lpty-1.0.1-1.src.rock
-- 
2.1.4
