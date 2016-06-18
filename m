From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jun 2016 15:06:41 +0200
Subject: [Buildroot] [git commit] package/erlang-p1-xml: add .hash file
Message-ID: <20160618131028.54060818E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa2d39494f39fc9383123986ec4fdbed86fed439
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the erlang-p1-xml tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to our
s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-p1-xml/erlang-p1-xml.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/erlang-p1-xml/erlang-p1-xml.hash b/package/erlang-p1-xml/erlang-p1-xml.hash
new file mode 100644
index 0000000..8e4a79f
--- /dev/null
+++ b/package/erlang-p1-xml/erlang-p1-xml.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 4c163c5b9572baa93eb97e03544db57dc751c7995a5279081a0d56f5fdaa2521 erlang-p1-xml-1.1.1.tar.gz
