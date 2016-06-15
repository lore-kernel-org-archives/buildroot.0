From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jun 2016 22:05:59 +0200
Subject: [Buildroot] [git commit] lpc3250loader: add .hash file
Message-ID: <20160615200802.A70B981F5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f47f721151825bc6aa1fda04e11b8320e680013d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/a60/a601f30d7100821ad0e303c6338348751d7aa99b/
http://autobuild.buildroot.org/results/56f/56f4e5f864da7e2176c78426d1d180c37966b181/

Similar to jquery-keyboard, it seems the lpc3250loader tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lpc3250loader/lpc3250loader.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lpc3250loader/lpc3250loader.hash b/package/lpc3250loader/lpc3250loader.hash
new file mode 100644
index 0000000..4f9dbc4
--- /dev/null
+++ b/package/lpc3250loader/lpc3250loader.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 267de7541c92e5b007b93c660a41188976d531a3757f4ffd9b7142d3994da7d1  lpc3250loader-1.0.tar.gz
