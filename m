From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Oct 2014 14:22:34 +0100
Subject: [Buildroot] [git commit] nuttcp: add tarball hash
Message-ID: <20141031132520.52B32B252B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b49f37f358964891725c17fe7e0ddffeea7121c7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes (eventually, once the bad downloads are deleted):
http://autobuild.buildroot.net/results/055/0556ffec533af65392c24f7c74092d3282245c95/
http://autobuild.buildroot.net/results/481/4810de845bac9ec28cba86379de0f8c554038ea0/
http://autobuild.buildroot.net/results/384/384b627a104793f460072aa43381a8c2d703a693/
http://autobuild.buildroot.net/results/2f8/2f8574a5bc692e3dfb803b420fb6ae2dc420cfed/

And many others.

There's no upstream hash, but this matches E.G. Freebsd:

http://lists.freebsd.org/pipermail/freebsd-ports-bugs/2009-August/170685.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nuttcp/nuttcp.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/nuttcp/nuttcp.hash b/package/nuttcp/nuttcp.hash
new file mode 100644
index 0000000..88310a3
--- /dev/null
+++ b/package/nuttcp/nuttcp.hash
@@ -0,0 +1,2 @@
+# From http://lists.freebsd.org/pipermail/freebsd-ports-bugs/2009-August/170685.html
+sha256	054e96d9d68fe917df6f25fab15c7755bdd480f6420d7d48d9194a1a52378169  nuttcp-6.1.2.tar.bz2
