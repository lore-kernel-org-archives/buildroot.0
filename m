From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Jan 2015 16:38:50 +0100
Subject: [Buildroot] [git commit] eudev: bump version
Message-ID: <20150123155105.63ADE800BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9711d8b824ff0cee786ef9c131e8f38ddc324b91
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash and update/rename patch for new naming convention.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-use-pragma-for-ignoring-diagnostics-if-.patch} |    0
 package/eudev/eudev.hash                           |    2 ++
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/eudev/eudev-0003-libudev-Only-use-pragma-for-ignoring-diagnostics-if-.patch b/package/eudev/0001-Only-use-pragma-for-ignoring-diagnostics-if-.patch
similarity index 100%
rename from package/eudev/eudev-0003-libudev-Only-use-pragma-for-ignoring-diagnostics-if-.patch
rename to package/eudev/0001-Only-use-pragma-for-ignoring-diagnostics-if-.patch
diff --git a/package/eudev/eudev.hash b/package/eudev/eudev.hash
new file mode 100644
index 0000000..6a85508
--- /dev/null
+++ b/package/eudev/eudev.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	6aef101c5496a2dc45e669307d478dbccb0ee0462a285512edcda51ff12e0e6a  eudev-2.1.1.tar.gz
