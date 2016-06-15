From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jun 2016 22:17:22 +0200
Subject: [Buildroot] [git commit] cpuload: add .hash file
Message-ID: <20160615201733.EC6F781E96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b1460e6100813d691f9b974af201110fd9e2b94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/e59/e595a49833bf3046af6fd6ef4ddb7443d40771b9/

Similar to jquery-keyboard, it seems the cpuload tarball on the autobuilder
is corrupt.  Fix it by adding a .hash file so it falls back to our s.b.o
mirror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cpuload/cpuload.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/cpuload/cpuload.hash b/package/cpuload/cpuload.hash
new file mode 100644
index 0000000..02861ff
--- /dev/null
+++ b/package/cpuload/cpuload.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 1d61f4776dc3e2746343d68b2ea2faf138e54666b630a6060df4f3945badbcae  cpuload-v0.3.tar.gz
