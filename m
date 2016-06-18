From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Jun 2016 22:47:57 +0200
Subject: [Buildroot] [git commit] package/bandwidthd: add .hash file
Message-ID: <20160618205842.588DF7F98D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d85fa96fa919b9deb142bc50e37507b9d542e61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the bandwidthd tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bandwidthd/bandwidthd.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/bandwidthd/bandwidthd.hash b/package/bandwidthd/bandwidthd.hash
new file mode 100644
index 0000000..248f9ff
--- /dev/null
+++ b/package/bandwidthd/bandwidthd.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 0270d0def6cc53c8d47d59a9dd093d51fbca1620adeef85c15e35a32010e26ab  bandwidthd-v2.0.1-auto-r11.tar.gz
