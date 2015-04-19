From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 09:41:14 +0200
Subject: [Buildroot] [git commit] python: add hash file
Message-ID: <20150419074553.965F18040E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=99f2f9aab94630b52c01d1d7fc7383449be940e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though there's a hash at
https://www.python.org/downloads/release/python-279/ prefer using the
sig since that's just md5.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python/python.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/python/python.hash b/package/python/python.hash
new file mode 100644
index 0000000..f741e85
--- /dev/null
+++ b/package/python/python.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	90d27e14ea7e03570026850e2e50ba71ad20b7eb31035aada1cf3def8f8d4916	Python-2.7.9.tar.xz
