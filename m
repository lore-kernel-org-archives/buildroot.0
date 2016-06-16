From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jun 2016 22:30:47 +0200
Subject: [Buildroot] [git commit] glm: add .hash file
Message-ID: <20160616203153.29D6F80E27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b62898f5e2608751806fd8a4b6e7916b2d485ccd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/2c3/2c308c9f63b86f75b4ce8293f8bd1211cb9f4819/
http://autobuild.buildroot.org/results/ff5/ff5058cb59282a8746396f21d700bbaefc859a2d/

Similar to jquery-keyboard, it seems the glm tarball on the autobuilder is
corrupt.  Fix it by adding a .hash file so it falls back to our s.b.o
mirror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glm/glm.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/glm/glm.hash b/package/glm/glm.hash
new file mode 100644
index 0000000..30bb923
--- /dev/null
+++ b/package/glm/glm.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 39c7ee0db54289f78350c7629ea2531664d71c6a494bbb86db48a86536de9ff2  glm-0.9.5.4.tar.gz
