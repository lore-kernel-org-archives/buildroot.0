From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 16 Jun 2016 23:24:02 +0200
Subject: [Buildroot] [PATCH 12/13] package/erlang-p1-zlib: add .hash file
In-Reply-To: <1466112243-17982-1-git-send-email-romain.naour@gmail.com>
References: <1466112243-17982-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466112243-17982-12-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the erlang-p1-zlib tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to our
s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/erlang-p1-zlib/erlang-p1-zlib.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/erlang-p1-zlib/erlang-p1-zlib.hash

diff --git a/package/erlang-p1-zlib/erlang-p1-zlib.hash b/package/erlang-p1-zlib/erlang-p1-zlib.hash
new file mode 100644
index 0000000..488e752
--- /dev/null
+++ b/package/erlang-p1-zlib/erlang-p1-zlib.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 cb534ee8d8746e38027ada0ccd7e910daa025c74461286ded60ffaa933e3cf7b erlang-p1-zlib-1.0.0.tar.gz
-- 
2.5.5
