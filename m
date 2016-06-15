From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jun 2016 21:45:42 +0200
Subject: [Buildroot] [git commit] tinyxml2: add .hash file
Message-ID: <20160615194818.8C67381D71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d330c27ce993f698bba7c6c78ee70f87e12fc49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/ae6/ae648f40e0f51628000b2d2297759c5fdf1b4d16/
http://autobuild.buildroot.org/results/799/79923f099bf0f2e88ccbb7fc2d3d92a85c167057/

Similar to jquery-keyboard, it seems the tinyxml2 tarball on the autobuilder
is corrupt. Fix it by adding a .hash file so it falls back to out s.b.o mirror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tinyxml2/tinyxml2.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/tinyxml2/tinyxml2.hash b/package/tinyxml2/tinyxml2.hash
new file mode 100644
index 0000000..f6064df
--- /dev/null
+++ b/package/tinyxml2/tinyxml2.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 f891224f32e7a06bf279290619cec80cc8ddc335c13696872195ffb87f5bce67  tinyxml2-2.2.0.tar.gz
