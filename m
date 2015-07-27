From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 27 Jul 2015 20:51:04 +0200
Subject: [Buildroot] [PATCH 13/32] lua-coatpersistent: add hash file
In-Reply-To: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
References: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1438023083-19010-13-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-coatpersistent/lua-coatpersistent.hash | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/lua-coatpersistent/lua-coatpersistent.hash

diff --git a/package/lua-coatpersistent/lua-coatpersistent.hash b/package/lua-coatpersistent/lua-coatpersistent.hash
new file mode 100644
index 0000000..ddd3c9b
--- /dev/null
+++ b/package/lua-coatpersistent/lua-coatpersistent.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256	46f5a1988a47b988d729df2937589756d989df7c26dac6aaf2a331a7b15bf7cf  lua-coatpersistent-lsqlite3-0.2.1-1.src.rock
+sha256	8053428fa7a6229d70ae161ec55a24b28c210078ac494161d48b6bf74ed000ca  lua-coatpersistent-luasql-0.2.1-1.src.rock
-- 
2.1.4
