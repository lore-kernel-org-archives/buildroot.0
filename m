From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:28:22 -0300
Subject: [Buildroot] [PATCH 31/40] less: add hash file
In-Reply-To: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436984911-17680-31-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/less/less.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/less/less.hash

diff --git a/package/less/less.hash b/package/less/less.hash
new file mode 100644
index 0000000..b1a227e
--- /dev/null
+++ b/package/less/less.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	e536c7819ede54b3d487f0ffc4c14b3620bed83734d92a81e89f62346db0fcac	less-458.tar.gz
-- 
2.3.6
