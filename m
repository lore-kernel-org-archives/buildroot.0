From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jun 2016 23:55:14 +0200
Subject: [Buildroot] [git commit] fb-test-app: add .hash file
Message-ID: <20160615215547.ACBD781E81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b4797798e06ebc8ff71c63550feac7d922092391
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/9aa/9aa6818d67d9cfd0bfdf14945476c7783cc05aad/

Similar to jquery-keyboard, it seems the fb-test-app tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fb-test-app/fb-test-app.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/fb-test-app/fb-test-app.hash b/package/fb-test-app/fb-test-app.hash
new file mode 100644
index 0000000..7f73753
--- /dev/null
+++ b/package/fb-test-app/fb-test-app.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 6baf6b45968d0bb9a5527c6c4bf18661e9f9eb9be973a6d1952c38168c90d58f  fb-test-app-rosetta-1.1.0.tar.gz
