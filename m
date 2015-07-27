From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 27 Jul 2015 20:50:57 +0200
Subject: [Buildroot] [PATCH 06/32] ljlinenoise: add hash file
In-Reply-To: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
References: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1438023083-19010-6-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/ljlinenoise/ljlinenoise.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/ljlinenoise/ljlinenoise.hash

diff --git a/package/ljlinenoise/ljlinenoise.hash b/package/ljlinenoise/ljlinenoise.hash
new file mode 100644
index 0000000..7b4a948
--- /dev/null
+++ b/package/ljlinenoise/ljlinenoise.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	a5fa2a88d8232bd0f97d3af9aafe780cd855830b42a9ab87c9ae2a5697b044a1  ljlinenoise-0.1.2-1.src.rock
-- 
2.1.4
