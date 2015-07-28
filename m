From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:16 -0300
Subject: [Buildroot] [PATCH 015/113] giblib: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-15-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/giblib/giblib.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/giblib/giblib.hash

diff --git a/package/giblib/giblib.hash b/package/giblib/giblib.hash
new file mode 100644
index 0000000..942aee7
--- /dev/null
+++ b/package/giblib/giblib.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	176611c4d88d742ea4013991ad54c2f9d2feefbc97a28434c0f48922ebaa8bac  giblib-1.2.4.tar.gz
-- 
2.3.6
