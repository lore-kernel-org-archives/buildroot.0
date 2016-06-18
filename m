From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 18 Jun 2016 18:43:05 +0200
Subject: [Buildroot] [PATCH 05/19] package/filemq: add .hash file
In-Reply-To: <1466268199-5417-1-git-send-email-romain.naour@gmail.com>
References: <1466268199-5417-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466268199-5417-5-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the filemq tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/filemq/filemq.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/filemq/filemq.hash

diff --git a/package/filemq/filemq.hash b/package/filemq/filemq.hash
new file mode 100644
index 0000000..1a7997e
--- /dev/null
+++ b/package/filemq/filemq.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 c373eddd5154cfe63f6cc6b3255ec20dca1f70c1f1881b611930931df47babad  filemq-e59951489045825d6fc5bdc6a5a5ecf1abf51943.tar.gz
-- 
2.5.5
