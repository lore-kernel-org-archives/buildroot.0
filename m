From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:43 -0300
Subject: [Buildroot] [PATCH 102/113] tree: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-102-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/tree/tree.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/tree/tree.hash

diff --git a/package/tree/tree.hash b/package/tree/tree.hash
new file mode 100644
index 0000000..82994a9
--- /dev/null
+++ b/package/tree/tree.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	4dc470a74880338b01da41701d8db90d0fb178877e526d385931a007d68d7591	tree-1.6.0.tgz
-- 
2.3.6
