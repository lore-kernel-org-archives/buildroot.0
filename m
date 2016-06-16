From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jun 2016 23:01:24 +0200
Subject: [Buildroot] [git commit] libiqrf: add .hash file
Message-ID: <20160616210238.6F8FF82117@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=17a086627cd9c0c9bd18d4454982026736ce3a5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/e7a/e7adbfcc963ee3a76368b0f4af7ca63e69995546/

Similar to jquery-keyboard, it seems the libiqrf tarball on the autobuilder
is corrupt.  Fix it by adding a .hash file so it falls back to our s.b.o
mirror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libiqrf/libiqrf.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libiqrf/libiqrf.hash b/package/libiqrf/libiqrf.hash
new file mode 100644
index 0000000..12d526c
--- /dev/null
+++ b/package/libiqrf/libiqrf.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 8111031dd9dd6093a1927eb32dd7476fe22cfee9190043aa8e4c88003c104b16  libiqrf-v0.1.2.tar.gz
