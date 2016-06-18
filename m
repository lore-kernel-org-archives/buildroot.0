From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 18 Jun 2016 18:43:13 +0200
Subject: [Buildroot] [PATCH 13/19] package/libopenh264: add .hash file
In-Reply-To: <1466268199-5417-1-git-send-email-romain.naour@gmail.com>
References: <1466268199-5417-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466268199-5417-13-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the libopenh264 tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/libopenh264/libopenh264.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libopenh264/libopenh264.hash

diff --git a/package/libopenh264/libopenh264.hash b/package/libopenh264/libopenh264.hash
new file mode 100644
index 0000000..cb87188
--- /dev/null
+++ b/package/libopenh264/libopenh264.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 a1b9a7a7f1ee204793c613789a505f0971bc2b03b3dbd8f05d9c4a3f3b900a22  libopenh264-v1.4.0.tar.gz
-- 
2.5.5
