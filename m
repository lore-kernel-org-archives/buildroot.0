From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 18 Jun 2016 18:43:04 +0200
Subject: [Buildroot] [PATCH 04/19] package/civetweb: add .hash file
In-Reply-To: <1466268199-5417-1-git-send-email-romain.naour@gmail.com>
References: <1466268199-5417-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466268199-5417-4-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the civetweb tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/civetweb/civetweb.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/civetweb/civetweb.hash

diff --git a/package/civetweb/civetweb.hash b/package/civetweb/civetweb.hash
new file mode 100644
index 0000000..745f4a8
--- /dev/null
+++ b/package/civetweb/civetweb.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 79a852a26068eb6d2f8de5ee72e021f0d2c8bd176eb81f41909a876b736815d9  civetweb-v1.5.tar.gz
-- 
2.5.5
