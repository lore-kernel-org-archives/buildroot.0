From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:34 -0300
Subject: [Buildroot] [PATCH 033/113] libmpd: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-33-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libmpd/libmpd.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libmpd/libmpd.hash

diff --git a/package/libmpd/libmpd.hash b/package/libmpd/libmpd.hash
new file mode 100644
index 0000000..ca06c75
--- /dev/null
+++ b/package/libmpd/libmpd.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	fe20326b0d10641f71c4673fae637bf9222a96e1712f71f170fca2fc34bf7a83	libmpd-11.8.17.tar.gz
-- 
2.3.6
