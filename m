From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jun 2016 22:38:01 +0200
Subject: [Buildroot] [git commit] tinymembench: add .hash file
Message-ID: <20160616203857.7A20C81F9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0868d7980a0986c5b99f3240e384ced3c89cb382
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/bad/bad9b90db7e7ae352455205747a08e75e8e83376/

Similar to jquery-keyboard, it seems the tinymembench tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tinymembench/tinymembench.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/tinymembench/tinymembench.hash b/package/tinymembench/tinymembench.hash
new file mode 100644
index 0000000..813a1df
--- /dev/null
+++ b/package/tinymembench/tinymembench.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 e8cfcf0817eb8430f736426bc7557273765cef0e8002a17cca51645114e723b7  tinymembench-v0.3.tar.gz
