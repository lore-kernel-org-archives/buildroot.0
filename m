From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:15 -0300
Subject: [Buildroot] [PATCH 014/113] genpart: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-14-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/genpart/genpart.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/genpart/genpart.hash

diff --git a/package/genpart/genpart.hash b/package/genpart/genpart.hash
new file mode 100644
index 0000000..b741dbd
--- /dev/null
+++ b/package/genpart/genpart.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	bfb39434f31d10f1b8c7b6bc6ec612309838c2819022561541c4d2d5a424e3f2	genpart-1.0.2.tar.bz2
-- 
2.3.6
