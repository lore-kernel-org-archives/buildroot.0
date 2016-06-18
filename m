From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Jun 2016 22:50:12 +0200
Subject: [Buildroot] [git commit] package/filemq: add .hash file
Message-ID: <20160618205842.E737681976@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c4df2a8b597bf7225da9cd161993d0382415b482
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the filemq tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/filemq/filemq.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/filemq/filemq.hash b/package/filemq/filemq.hash
new file mode 100644
index 0000000..1a7997e
--- /dev/null
+++ b/package/filemq/filemq.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 c373eddd5154cfe63f6cc6b3255ec20dca1f70c1f1881b611930931df47babad  filemq-e59951489045825d6fc5bdc6a5a5ecf1abf51943.tar.gz
