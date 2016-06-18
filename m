From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jun 2016 15:06:34 +0200
Subject: [Buildroot] [git commit] package/erlang-p1-stun: add .hash file
Message-ID: <20160618131028.0506A818E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6f986913def0ef6e42c599b7e75c4114bc4cb23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the erlang-p1-stun tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to our
s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-p1-stun/erlang-p1-stun.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/erlang-p1-stun/erlang-p1-stun.hash b/package/erlang-p1-stun/erlang-p1-stun.hash
new file mode 100644
index 0000000..be56608
--- /dev/null
+++ b/package/erlang-p1-stun/erlang-p1-stun.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 ca33833f4b6ef70a7628e6f3697d15cb4e26d32ef4e5a31bbddee86cabe19c50 erlang-p1-stun-0.9.0.tar.gz
