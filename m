From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 16 Jun 2016 23:23:57 +0200
Subject: [Buildroot] [PATCH 07/13] package/erlang-p1-stun: add .hash file
In-Reply-To: <1466112243-17982-1-git-send-email-romain.naour@gmail.com>
References: <1466112243-17982-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466112243-17982-7-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the erlang-p1-stun tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to our
s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/erlang-p1-stun/erlang-p1-stun.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/erlang-p1-stun/erlang-p1-stun.hash

diff --git a/package/erlang-p1-stun/erlang-p1-stun.hash b/package/erlang-p1-stun/erlang-p1-stun.hash
new file mode 100644
index 0000000..be56608
--- /dev/null
+++ b/package/erlang-p1-stun/erlang-p1-stun.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 ca33833f4b6ef70a7628e6f3697d15cb4e26d32ef4e5a31bbddee86cabe19c50 erlang-p1-stun-0.9.0.tar.gz
-- 
2.5.5
