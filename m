From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Oct 2018 13:42:15 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/android-tools:
 update upstream URL in Config.in help
Message-ID: <20181005114121.664688D250@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02a4f31b47e983f937703151d16aad9d66fb9988
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b7490dbd31bd995d29465cb2d47811d19088e891)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/android-tools/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/android-tools/Config.in b/package/android-tools/Config.in
index 96e36e6cd7..478f1392dc 100644
--- a/package/android-tools/Config.in
+++ b/package/android-tools/Config.in
@@ -15,6 +15,8 @@ config BR2_PACKAGE_ANDROID_TOOLS
 	  can be used to interact with target devices using of these
 	  protocols.
 
+	  https://wiki.debian.org/AndroidTools#Original_android-tools_package
+
 if BR2_PACKAGE_ANDROID_TOOLS
 
 # We need kernel headers that support the __SANE_USERSPACE_TYPES__
