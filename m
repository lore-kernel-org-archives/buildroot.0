From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Oct 2014 08:05:06 +0200
Subject: [Buildroot] [git commit] bzip2: add hash file
Message-ID: <20141016060905.9A7CF9D858@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6d4b814c84fdc5f0ed69508c0178385d499e2ba9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bzip2/bzip2.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/bzip2/bzip2.hash b/package/bzip2/bzip2.hash
new file mode 100644
index 0000000..60b0a19
--- /dev/null
+++ b/package/bzip2/bzip2.hash
@@ -0,0 +1,2 @@
+# From http://www.bzip.org/downloads.html
+md5	00b516f4704d4a7cb50a1d97e6e8e15b	bzip2-1.0.6.tar.gz
