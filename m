From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Nov 2015 17:17:19 +0100
Subject: [Buildroot] [git commit] micropython-lib: Add hash file
Message-ID: <20151201232121.6337581932@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ba47817d52fb304b0227c318e3a8d9a8e5494ea9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/micropython-lib/micropython-lib.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/micropython-lib/micropython-lib.hash b/package/micropython-lib/micropython-lib.hash
new file mode 100644
index 0000000..7ab22d5
--- /dev/null
+++ b/package/micropython-lib/micropython-lib.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 f66bfe0e7d2d61119a5def989f74278f42bee7d04162913ea60d3f2955d65909  micropython-lib-v0.5.tar.gz
