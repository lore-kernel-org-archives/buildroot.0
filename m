From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Jun 2016 22:52:23 +0200
Subject: [Buildroot] [git commit] package/ktap: add .hash file
Message-ID: <20160618205843.4E30E7FCE9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9baec982a42212b84ca839be13edb9454b381028
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the ktap tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ktap/ktap.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ktap/ktap.hash b/package/ktap/ktap.hash
new file mode 100644
index 0000000..d58bd85
--- /dev/null
+++ b/package/ktap/ktap.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 bc8b03a53c430ae4fcf594ffdf31e2b2ed47a8fee25dd8fea60aa34f75441707  ktap-eb66d40310c93dc82bc8eac889744c1ed1f01f7b.tar.gz
