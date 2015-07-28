From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:32 -0300
Subject: [Buildroot] [PATCH 031/113] libmatroska: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-31-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libmatroska/libmatroska.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libmatroska/libmatroska.hash

diff --git a/package/libmatroska/libmatroska.hash b/package/libmatroska/libmatroska.hash
new file mode 100644
index 0000000..4d9a535
--- /dev/null
+++ b/package/libmatroska/libmatroska.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	bea10320f1f1fd121bbd7db9ffc77b2518e8269f00903549c5425478bbf8393f	libmatroska-1.4.2.tar.bz2
-- 
2.3.6
