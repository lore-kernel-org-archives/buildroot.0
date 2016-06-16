From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 16 Jun 2016 23:23:51 +0200
Subject: [Buildroot] [PATCH 01/13] package/erlang-goldrush: add .hash file
Message-ID: <1466112243-17982-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the erlang-goldrush tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to our
s.b.o mirror.

Fixes:
http://autobuild.buildroot.org/results/074/07463f3478f334ab9c7dda2dbb2a02b4f29faca1

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/erlang-goldrush/erlang-goldrush.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/erlang-goldrush/erlang-goldrush.hash

diff --git a/package/erlang-goldrush/erlang-goldrush.hash b/package/erlang-goldrush/erlang-goldrush.hash
new file mode 100644
index 0000000..00ccb43
--- /dev/null
+++ b/package/erlang-goldrush/erlang-goldrush.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 739d8ce15049c54f7e00528edbf536f63a24fdb9dfa053d176e6f97a9832b834 erlang-goldrush-0.1.8.tar.gz
-- 
2.5.5
