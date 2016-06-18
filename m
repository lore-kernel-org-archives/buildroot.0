From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 18 Jun 2016 18:43:14 +0200
Subject: [Buildroot] [PATCH 14/19] package/libpam-tacplus: add .hash file
In-Reply-To: <1466268199-5417-1-git-send-email-romain.naour@gmail.com>
References: <1466268199-5417-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466268199-5417-14-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the libpam-tacplus tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/libpam-tacplus/libpam-tacplus.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libpam-tacplus/libpam-tacplus.hash

diff --git a/package/libpam-tacplus/libpam-tacplus.hash b/package/libpam-tacplus/libpam-tacplus.hash
new file mode 100644
index 0000000..c8a7723
--- /dev/null
+++ b/package/libpam-tacplus/libpam-tacplus.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 747f7ad980a3726ed3abc5fec92e867efa8af8c53caac547cab7eb6af5ce0edf  libpam-tacplus-1.3.9.tar.gz
-- 
2.5.5
