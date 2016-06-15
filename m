From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jun 2016 22:37:13 +0200
Subject: [Buildroot] [git commit] sunxi-mali: add .hash file
Message-ID: <20160615203825.BA692818B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d5e02de18271471fa649004bda239110df25aba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/3e2/3e26462743269001510ac8a072cd61c86f2a63b3/

Similar to jquery-keyboard, it seems the sunxi-mali tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sunxi-mali/sunxi-mali.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/sunxi-mali/sunxi-mali.hash b/package/sunxi-mali/sunxi-mali.hash
new file mode 100644
index 0000000..7953e9e
--- /dev/null
+++ b/package/sunxi-mali/sunxi-mali.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 5ae27be532928667aa820a0aa9813dde545c224294b9402b27b6ca68f4d69ee4  sunxi-mali-d343311efc8db166d8371b28494f0f27b6a58724.tar.gz
