From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Apr 2015 08:53:35 +0200
Subject: [Buildroot] [git commit] gdb: add hash file
Message-ID: <20150428065522.7A63E81D7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2a15ce89ac5a46a161c2cf7d5ddb420ed95a4117
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/gdb.hash |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
new file mode 100644
index 0000000..f489f64
--- /dev/null
+++ b/package/gdb/gdb.hash
@@ -0,0 +1,7 @@
+# From ftp://gcc.gnu.org/pub/gdb/releases/sha512.sum
+sha512	887b9b726dae8f6e3e5e41574460a67e4f9002b0d47bc985dcf63bdf3518397a90b6a208cb5b19e5ed2341715ad75cfeed4df4fb423f39f74218e36bc87f1cab	gdb-7.7.1.tar.bz2
+sha512	face5bf1b4ce144fc8604fc84620beed956177a11fd632b4e41906fc7f632910b2b43a50e6cfdfd6cbd876ee527c813bddab8df29dc560a6c36694cdb8edc4e4	gdb-7.8.2.tar.xz
+sha512	850202a477b486a75dc8196efead79c95bc675e348064a5eefee2a50215d40f62e9e052e9b8df29f997f91430f6e7454883652c701f5b1e688d9e2c575876c83	gdb-7.9.tar.xz
+# No hash for the ARC & microblaze variants, comes from the github-helper:
+none	xxx	gdb-arc-2014.12-gdb.tar.gz
+none	xxx	gdb-6be65fb56ea6694a9260733a536a023a1e2d4d57.tar.gz
