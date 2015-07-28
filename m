From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:05 -0300
Subject: [Buildroot] [PATCH 064/113] newt: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-64-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/newt/newt.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/newt/newt.hash

diff --git a/package/newt/newt.hash b/package/newt/newt.hash
new file mode 100644
index 0000000..ca64f41
--- /dev/null
+++ b/package/newt/newt.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	771b0e634ede56ae6a6acd910728bb5832ac13ddb0d1d27919d2498dab70c91e	newt-0.52.18.tar.gz
-- 
2.3.6
