From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jun 2016 15:06:23 +0200
Subject: [Buildroot] [git commit] package/erlang-goldrush: add .hash file
Message-ID: <20160618131027.49F3C818E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af096993c4d89d0ec08342c2c33f3e448f7786ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the erlang-goldrush tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to our
s.b.o mirror.

Fixes:
http://autobuild.buildroot.org/results/074/07463f3478f334ab9c7dda2dbb2a02b4f29faca1

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-goldrush/erlang-goldrush.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/erlang-goldrush/erlang-goldrush.hash b/package/erlang-goldrush/erlang-goldrush.hash
new file mode 100644
index 0000000..00ccb43
--- /dev/null
+++ b/package/erlang-goldrush/erlang-goldrush.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 739d8ce15049c54f7e00528edbf536f63a24fdb9dfa053d176e6f97a9832b834 erlang-goldrush-0.1.8.tar.gz
