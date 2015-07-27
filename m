From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 27 Jul 2015 20:50:55 +0200
Subject: [Buildroot] [PATCH 04/32] dado: add hash file
In-Reply-To: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
References: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1438023083-19010-4-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/dado/dado.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/dado/dado.hash

diff --git a/package/dado/dado.hash b/package/dado/dado.hash
new file mode 100644
index 0000000..3f17f08
--- /dev/null
+++ b/package/dado/dado.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	b7a68583c36643ad9040937d7e2b99230af7da83c7cbd13c9923881f1eb7490f  dado-1.6.0-1.src.rock
-- 
2.1.4
