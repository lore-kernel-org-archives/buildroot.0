From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:27:58 -0300
Subject: [Buildroot] [PATCH 07/40] spice-protocol: add hash file
In-Reply-To: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436984911-17680-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/spice-protocol/spice-protocol.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/spice-protocol/spice-protocol.hash

diff --git a/package/spice-protocol/spice-protocol.hash b/package/spice-protocol/spice-protocol.hash
new file mode 100644
index 0000000..2e88855
--- /dev/null
+++ b/package/spice-protocol/spice-protocol.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	9d4745602eb2ab1d1c1ab98b4babf587574870993b4faefe354ac57bb5e8259b	spice-protocol-0.12.6.tar.bz2
-- 
2.3.6
