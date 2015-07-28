From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:06 -0300
Subject: [Buildroot] [PATCH 005/113] enscript: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/enscript/enscript.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/enscript/enscript.hash

diff --git a/package/enscript/enscript.hash b/package/enscript/enscript.hash
new file mode 100644
index 0000000..8b7694d
--- /dev/null
+++ b/package/enscript/enscript.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	6d56bada6934d055b34b6c90399aa85975e66457ac5bf513427ae7fc77f5c0bb	enscript-1.6.6.tar.gz
-- 
2.3.6
