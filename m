From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jun 2016 22:43:04 +0200
Subject: [Buildroot] [git commit] python-itsdangerous: add .hash file
Message-ID: <20160615204512.111337FBDC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=54b9786ee0605c494cdbdac834b2da4a2d76bf67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/596/596f5d6eee03ce94adaca34a6f5b61aed7f929ce/
http://autobuild.buildroot.org/results/a4d/a4d836ab3a0b571b6eab232dc66b5b6ff238d440/

Similar to jquery-keyboard, it seems the python-itsdangerous tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-itsdangerous/python-itsdangerous.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-itsdangerous/python-itsdangerous.hash b/package/python-itsdangerous/python-itsdangerous.hash
new file mode 100644
index 0000000..a927b8b
--- /dev/null
+++ b/package/python-itsdangerous/python-itsdangerous.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 b035b2da1d493b00a5ee7a5b750f96929de87b610643939fbe382902774626fc  python-itsdangerous-0.24.tar.gz
