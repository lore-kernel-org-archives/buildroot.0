From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 27 Apr 2015 10:02:57 -0300
Subject: [Buildroot] [PATCH 06/16] neon: add hash file
In-Reply-To: <1430139787-19304-1-git-send-email-gustavo@zacarias.com.ar>
References: <1430139787-19304-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1430139787-19304-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/neon/neon.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/neon/neon.hash

diff --git a/package/neon/neon.hash b/package/neon/neon.hash
new file mode 100644
index 0000000..9db5f82
--- /dev/null
+++ b/package/neon/neon.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	2962cfcb5d30f3272e3d2fa0e473434419770a3801afe3d46e5d1650787990c2	neon-0.30.0.tar.gz
-- 
2.0.5
