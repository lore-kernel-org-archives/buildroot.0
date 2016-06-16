From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 16 Jun 2016 23:24:01 +0200
Subject: [Buildroot] [PATCH 11/13] package/erlang-p1-yaml: add .hash file
In-Reply-To: <1466112243-17982-1-git-send-email-romain.naour@gmail.com>
References: <1466112243-17982-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466112243-17982-11-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the erlang-p1-yaml tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to our
s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/erlang-p1-yaml/erlang-p1-yaml.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/erlang-p1-yaml/erlang-p1-yaml.hash

diff --git a/package/erlang-p1-yaml/erlang-p1-yaml.hash b/package/erlang-p1-yaml/erlang-p1-yaml.hash
new file mode 100644
index 0000000..0e11e45
--- /dev/null
+++ b/package/erlang-p1-yaml/erlang-p1-yaml.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 8eaaddda056f1ebb515a5456ba2be855e5b71b9b6eb35788527f39c6600ac6b4 erlang-p1-yaml-1.0.0.tar.gz
-- 
2.5.5
