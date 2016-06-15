From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jun 2016 22:49:02 +0200
Subject: [Buildroot] [git commit] jsmin: add .hash file
Message-ID: <20160615204906.029D281FC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b735b704d169b558a599f40404fce99d95c0219a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/c05/c05a9da77c4d8ad1e64e029c9e2fd65ebf35772d/
http://autobuild.buildroot.org/results/6ac/6acb5d5c56ece6cefdd135bdb90be035a3200e0a/

Similar to jquery-keyboard, it seems the jsmin tarball on the autobuilder is
corrupt.  Fix it by adding a .hash file so it falls back to our s.b.o
mirror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jsmin/jsmin.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/jsmin/jsmin.hash b/package/jsmin/jsmin.hash
new file mode 100644
index 0000000..6080f10
--- /dev/null
+++ b/package/jsmin/jsmin.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 aae127bf7291a7b2592f36599e5ed6c6423eac7abe0cd5992f82d6d46fe9ed2d  jsmin-1bf6ce5f74a9f8752ac7f5d115b8d7ccb31cfe1b.tar.gz
