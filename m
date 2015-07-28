From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:51 -0300
Subject: [Buildroot] [PATCH 110/113] dcron: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-110-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dcron/dcron.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/dcron/dcron.hash

diff --git a/package/dcron/dcron.hash b/package/dcron/dcron.hash
new file mode 100644
index 0000000..3e53ddc
--- /dev/null
+++ b/package/dcron/dcron.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	9e50edb6f5bd8153b16bad05087d985e5153ce45cc01ae77e7f842213fb4a824	dcron-4.5.tar.gz
-- 
2.3.6
