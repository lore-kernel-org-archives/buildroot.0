From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 10 May 2015 22:33:06 +0200
Subject: [Buildroot] [PATCH 3/3] package/gnuchess: add hash
In-Reply-To: <1431289986-20427-1-git-send-email-romain.naour@openwide.fr>
References: <1431289986-20427-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1431289986-20427-3-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/gnuchess/gnuchess.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/gnuchess/gnuchess.hash

diff --git a/package/gnuchess/gnuchess.hash b/package/gnuchess/gnuchess.hash
new file mode 100644
index 0000000..26342bc
--- /dev/null
+++ b/package/gnuchess/gnuchess.hash
@@ -0,0 +1,2 @@
+# sha256 locally computed
+sha256	17caab725539447bcb17a14b17905242cbf287087e53a6777524feb7bbaeed06	gnuchess-6.2.1.tar.gz
-- 
1.9.3
