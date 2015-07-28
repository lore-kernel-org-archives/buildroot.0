From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:56 -0300
Subject: [Buildroot] [PATCH 055/113] maccchanger: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-55-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/macchanger/macchanger.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/macchanger/macchanger.hash

diff --git a/package/macchanger/macchanger.hash b/package/macchanger/macchanger.hash
new file mode 100644
index 0000000..d0b6f35
--- /dev/null
+++ b/package/macchanger/macchanger.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	31534f138f1d21fa247be74ba6bef3fbfa47bbcd5033e99bd10c432fe58e51f7	macchanger-1.6.0.tar.gz
-- 
2.3.6
