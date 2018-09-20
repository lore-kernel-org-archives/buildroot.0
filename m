From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Sep 2018 22:20:22 +0200
Subject: [Buildroot] [git commit] package/android-tools: update upstream URL
 in Config.in help
Message-ID: <20180920202053.1789F886CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7490dbd31bd995d29465cb2d47811d19088e891
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
