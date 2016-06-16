From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jun 2016 08:44:23 +0200
Subject: [Buildroot] [git commit] jack2: add .hash file
Message-ID: <20160616064526.9BB1F81D34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e57bdcaf0b71a382896b641ab7d8219b3c181e2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/cc3/cc3590d9c602b38701398786741fceb612445b92/
http://autobuild.buildroot.org/results/2a6/2a691d01d8c91aa1058960f5176ad611b3549f36/

Similar to jquery-keyboard, it seems the jack2 tarball on the autobuilder
is corrupt.  Fix it by adding a .hash file so it falls back to our s.b.o
mirror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jack2/jack2.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/jack2/jack2.hash b/package/jack2/jack2.hash
new file mode 100644
index 0000000..ab031b9
--- /dev/null
+++ b/package/jack2/jack2.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 88f1b6601b7c8950e6a2d5940b423a33ee628ae5583da40bdce3d9317d8c600d  jack2-v1.9.10.tar.gz
