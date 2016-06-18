From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jun 2016 15:06:43 +0200
Subject: [Buildroot] [git commit] package/erlang-p1-yaml: add .hash file
Message-ID: <20160618131028.69290818E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e97a0ed10ce1eccbc1103f62656db8ae5e0145a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the erlang-p1-yaml tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to our
s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-p1-yaml/erlang-p1-yaml.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/erlang-p1-yaml/erlang-p1-yaml.hash b/package/erlang-p1-yaml/erlang-p1-yaml.hash
new file mode 100644
index 0000000..0e11e45
--- /dev/null
+++ b/package/erlang-p1-yaml/erlang-p1-yaml.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 8eaaddda056f1ebb515a5456ba2be855e5b71b9b6eb35788527f39c6600ac6b4 erlang-p1-yaml-1.0.0.tar.gz
