From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jun 2016 15:06:28 +0200
Subject: [Buildroot] [git commit] package/erlang-p1-iconv: add .hash file
Message-ID: <20160618131027.A60CD818E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b329c48ba9eeac78f5415e8ccb94de0aa894bcb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the erlang-p1-iconv tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to our
s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-p1-iconv/erlang-p1-iconv.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/erlang-p1-iconv/erlang-p1-iconv.hash b/package/erlang-p1-iconv/erlang-p1-iconv.hash
new file mode 100644
index 0000000..a284189
--- /dev/null
+++ b/package/erlang-p1-iconv/erlang-p1-iconv.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 3ef1fb814fdf23e8ad8a210efb66681fa67cd42753be536521bf9686158880d3 erlang-p1-iconv-0.9.0.tar.gz
