From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jun 2016 23:52:39 +0200
Subject: [Buildroot] [git commit] cppzmq: add .hash file
Message-ID: <20160615215547.9A56C82037@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ea289857e84af6341e5229dd467803033ef7949
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/425/425ce97de58c53c4f56d43654c0ec8a7cd7c6430/

Similar to jquery-keyboard, it seems the cppzmq tarball on the autobuilder
is corrupt.  Fix it by adding a .hash file so it falls back to our s.b.o
mirror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cppzmq/cppzmq.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/cppzmq/cppzmq.hash b/package/cppzmq/cppzmq.hash
new file mode 100644
index 0000000..792fb17
--- /dev/null
+++ b/package/cppzmq/cppzmq.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 812b47f76c609e194b2607a186ff0d1b03b6a0c8ea13b20faa47570ddf38ef2c  cppzmq-68a7b09cfce01c4c279fba2cf91686fcfc566848.tar.gz
