From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 18 Jun 2016 18:43:03 +0200
Subject: [Buildroot] [PATCH 03/19] package/c-periphery: add .hash file
In-Reply-To: <1466268199-5417-1-git-send-email-romain.naour@gmail.com>
References: <1466268199-5417-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466268199-5417-3-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the c-periphery tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/c-periphery/c-periphery.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/c-periphery/c-periphery.hash

diff --git a/package/c-periphery/c-periphery.hash b/package/c-periphery/c-periphery.hash
new file mode 100644
index 0000000..516d340
--- /dev/null
+++ b/package/c-periphery/c-periphery.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 5ae4c3f9de0e64d8153ee58b85c4a5defb9f755c6ae215f11b46719bbbac1335  c-periphery-v1.0.3.tar.gz
-- 
2.5.5
