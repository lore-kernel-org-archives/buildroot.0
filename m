From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:18 -0300
Subject: [Buildroot] [PATCH 017/113] hiawatha: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-17-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/hiawatha/hiawatha.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/hiawatha/hiawatha.hash

diff --git a/package/hiawatha/hiawatha.hash b/package/hiawatha/hiawatha.hash
new file mode 100644
index 0000000..a9ac716
--- /dev/null
+++ b/package/hiawatha/hiawatha.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	5d9cdec51c618bb3efab747030e593d9bd49dfaf3236254c8e0cb60715716dbf	hiawatha-9.2.tar.gz
-- 
2.3.6
