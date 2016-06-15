From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 15 Jun 2016 23:16:06 +0200
Subject: [Buildroot] [PATCH] package/smack: add .hash file
Message-ID: <1466025366-4096-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>

---
Peter, here's a little help! ;-)
---
 package/smack/smack.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/smack/smack.hash

diff --git a/package/smack/smack.hash b/package/smack/smack.hash
new file mode 100644
index 0000000..fd51249
--- /dev/null
+++ b/package/smack/smack.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  94dc21b4a5e570af0eb44debf57491170cccdbf60e03b5a3210f2a14d6448390  smack-v1.1.0.tar.gz
-- 
2.7.4
