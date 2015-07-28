From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:30 -0300
Subject: [Buildroot] [PATCH 089/113] ramsmp: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-89-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ramsmp/ramsmp.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/ramsmp/ramsmp.hash

diff --git a/package/ramsmp/ramsmp.hash b/package/ramsmp/ramsmp.hash
new file mode 100644
index 0000000..46aa3f1
--- /dev/null
+++ b/package/ramsmp/ramsmp.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	39fb15493fb3c293575746d56f6ab9faaa1d876d8b1f0d8e5a4042d2ace95839	ramsmp-3.5.0.tar.gz
-- 
2.3.6
