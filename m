From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:44 -0300
Subject: [Buildroot] [PATCH 103/113] ucl: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-103-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ucl/ucl.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/ucl/ucl.hash

diff --git a/package/ucl/ucl.hash b/package/ucl/ucl.hash
new file mode 100644
index 0000000..6b1f41e
--- /dev/null
+++ b/package/ucl/ucl.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	b865299ffd45d73412293369c9754b07637680e5c826915f097577cd27350348	ucl-1.03.tar.gz
-- 
2.3.6
