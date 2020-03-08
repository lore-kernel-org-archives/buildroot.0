From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Mar 2020 14:58:00 +0100
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20200308134529.98DE08FE5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e96faa72662c4de3b94f0861ff243c8640b6e51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/CHANGES b/CHANGES
index 50bb4f1c7c..9934f4916a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,21 @@
+2020.02, not yet released
+
+	Various fixes.
+
+	br2-external: Fix compatibility with make 4.3+
+
+	Updated/fixed packages: bash, bcm2835, cups, erlang-p1-acme,
+	fbgrab, gst1-plugins-base, gst1-validate, gstreamer1, guile,
+	jhead, libdrm, libevdev, libinput, libsndfile, libvncserver,
+	linux-firmware, mesa3d, nodejs, patch, piglit, python-django,
+	ruby, swupdate, thrift, zziplib
+
+	Removed packages: classpath, jamvm
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#12606: fbgrab location has changed
+
 2020.02-rc3, released March 2nd, 2020
 
 	Fixes all over the tree.
