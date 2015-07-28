From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:44 -0300
Subject: [Buildroot] [PATCH 043/113] libsocketcan: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-43-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libsocketcan/libsocketcan.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libsocketcan/libsocketcan.hash

diff --git a/package/libsocketcan/libsocketcan.hash b/package/libsocketcan/libsocketcan.hash
new file mode 100644
index 0000000..2546c66
--- /dev/null
+++ b/package/libsocketcan/libsocketcan.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	3c83e386c3fa7673141658472ae0b0e2a9f5849bf52fd9f7b22b04fd98ec7b6e	libsocketcan-0.0.10.tar.bz2
-- 
2.3.6
