From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:17 -0300
Subject: [Buildroot] [PATCH 016/113] gsl: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-16-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gsl/gsl.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/gsl/gsl.hash

diff --git a/package/gsl/gsl.hash b/package/gsl/gsl.hash
new file mode 100644
index 0000000..bc33e4e
--- /dev/null
+++ b/package/gsl/gsl.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	73bc2f51b90d2a780e6d266d43e487b3dbd78945dd0b04b14ca5980fe28d2f53	gsl-1.16.tar.gz
-- 
2.3.6
