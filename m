From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 18 Jun 2016 18:43:12 +0200
Subject: [Buildroot] [PATCH 12/19] package/libndp: add .hash file
In-Reply-To: <1466268199-5417-1-git-send-email-romain.naour@gmail.com>
References: <1466268199-5417-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466268199-5417-12-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the libndp tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/libndp/libndp.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libndp/libndp.hash

diff --git a/package/libndp/libndp.hash b/package/libndp/libndp.hash
new file mode 100644
index 0000000..51e312d
--- /dev/null
+++ b/package/libndp/libndp.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 42c0a8938d4302c72a42e2d954deef7e4903bb3974da6804a929a3cd0b5b6aa7  libndp-v1.5.tar.gz
-- 
2.5.5
