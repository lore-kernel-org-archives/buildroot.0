From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jun 2016 15:06:45 +0200
Subject: [Buildroot] [git commit] package/erlang-p1-zlib: add .hash file
Message-ID: <20160618131028.81A85819EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c5878e99fa573d9230d2f28f240610d75136610
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the erlang-p1-zlib tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to our
s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-p1-zlib/erlang-p1-zlib.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/erlang-p1-zlib/erlang-p1-zlib.hash b/package/erlang-p1-zlib/erlang-p1-zlib.hash
new file mode 100644
index 0000000..488e752
--- /dev/null
+++ b/package/erlang-p1-zlib/erlang-p1-zlib.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 cb534ee8d8746e38027ada0ccd7e910daa025c74461286ded60ffaa933e3cf7b erlang-p1-zlib-1.0.0.tar.gz
