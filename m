From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 18 Jun 2016 19:32:32 +0200
Subject: [Buildroot] [PATCH 10/11] package/qlibc: add .hash file
In-Reply-To: <1466271153-18961-1-git-send-email-romain.naour@gmail.com>
References: <1466271153-18961-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466271153-18961-10-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the qlibc tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/qlibc/qlibc.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/qlibc/qlibc.hash

diff --git a/package/qlibc/qlibc.hash b/package/qlibc/qlibc.hash
new file mode 100644
index 0000000..6b8e4d8
--- /dev/null
+++ b/package/qlibc/qlibc.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 1f9aa5eefd28c45d409130a35104816d41405da64fe900f70a1c41150891501a  qlibc-v2.4.1.tar.gz
-- 
2.5.5
