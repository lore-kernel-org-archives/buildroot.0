From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 27 Apr 2015 10:02:53 -0300
Subject: [Buildroot] [PATCH 02/16] guile: add hash file
In-Reply-To: <1430139787-19304-1-git-send-email-gustavo@zacarias.com.ar>
References: <1430139787-19304-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1430139787-19304-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/guile/guile.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/guile/guile.hash

diff --git a/package/guile/guile.hash b/package/guile/guile.hash
new file mode 100644
index 0000000..9ba0bf5
--- /dev/null
+++ b/package/guile/guile.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	aed0a4a6db4e310cbdfeb3613fa6f86fddc91ef624c1e3f8937a6304c69103e2	guile-2.0.11.tar.xz
-- 
2.0.5
