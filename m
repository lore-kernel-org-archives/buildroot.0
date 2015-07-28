From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:45 -0300
Subject: [Buildroot] [PATCH 104/113] urg: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-104-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/urg/urg.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/urg/urg.hash

diff --git a/package/urg/urg.hash b/package/urg/urg.hash
new file mode 100644
index 0000000..5764a14
--- /dev/null
+++ b/package/urg/urg.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	b2cab7e539c90c60fc99a2350a42b5d5390ff952b694b196c3cbb54623cfee7f	urg-0.8.18.zip
-- 
2.3.6
