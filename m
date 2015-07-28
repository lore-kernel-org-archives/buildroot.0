From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:08 -0300
Subject: [Buildroot] [PATCH 007/113] fbgrab: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/fbgrab/fbgrab.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/fbgrab/fbgrab.hash

diff --git a/package/fbgrab/fbgrab.hash b/package/fbgrab/fbgrab.hash
new file mode 100644
index 0000000..4652f2c
--- /dev/null
+++ b/package/fbgrab/fbgrab.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	61e0772ad6ea744ee597ae478398ddd0ba6fceee2cf343859bebde2c15bafb91	fbgrab-1.2.tar.gz
-- 
2.3.6
