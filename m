From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Feb 2015 00:15:59 +0100
Subject: [Buildroot] [git commit] directfb-examples: drop usr/bin path from
	sub options text
Message-ID: <20150226231816.1BB64817C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0278ba33bb0028454bb46e93dbed73401b33465d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Nowhere else do we list the explicit path where binaries are installed to,
so drop it from here.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/directfb-examples/Config.in |   52 +++++++++++++++++-----------------
 1 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/package/directfb-examples/Config.in b/package/directfb-examples/Config.in
index 51dd288..f69cd3b 100644
--- a/package/directfb-examples/Config.in
+++ b/package/directfb-examples/Config.in
@@ -11,146 +11,146 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES
 if BR2_PACKAGE_DIRECTFB_EXAMPLES
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_ANDI
-	bool "usr/bin/df_andi"
+	bool "df_andi"
 	help
 	  Penguin demo, press 'space' to form convergence logo,
 	  's'/'d' to spawn/destroy 'a' penguin, 'r' to revive penguin
 	  after space was pressed, 'c' tests clipping.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_BLTLOAD
-	bool "usr/bin/df_bltload"
+	bool "df_bltload"
 	help
 	  Reads information from /proc/bltstat.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_CPULOAD
-	bool "usr/bin/df_cpuload"
+	bool "df_cpuload"
 	help
 	  CPU Load with data from /proc/stat.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_DATABUFFER
-	bool "usr/bin/df_databuffer"
+	bool "df_databuffer"
 	help
 	  Simple test application for data buffers.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_DIOLOAD
-	bool "usr/bin/df_dioload"
+	bool "df_dioload"
 	help
 	  Disk IO with data from /proc/stat.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK
-	bool "usr/bin/df_dok"
+	bool "df_dok"
 	help
 	  DirectFB benchmark application, runs some tests and
 	  displays benchmark results afterwards.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_DRIVERTEST
-	bool "usr/bin/df_drivertest"
+	bool "df_drivertest"
 	help
 	  Tool to check drivers for bugs and accuracy.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_FIRE
-	bool "usr/bin/df_fire"
+	bool "df_fire"
 	help
 	  The famous fire effect ported to DirectFB (16 bpp only).
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_FLIP
-	bool "usr/bin/df_flip"
+	bool "df_flip"
 	help
 	  Raw Flip() benchmark.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_FONTS
-	bool "usr/bin/df_fonts"
+	bool "df_fonts"
 	help
 	  Takes a list of font files and shows character tables.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_INPUT
-	bool "usr/bin/df_input"
+	bool "df_input"
 	help
 	  Test application for input devices.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_JOYSTICK
-	bool "usr/bin/df_joystick"
+	bool "df_joystick"
 	help
 	  A colored version of df_particle, fointain can be moved with
 	  joystick. The particles of different colors can be spawned
 	  with different joystick buttons (1-4).
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_KNUCKLES
-	bool "usr/bin/df_knuckles"
+	bool "df_knuckles"
 	help
 	  3D skull drawn using triangles that can be rotated using
 	  the mouse. 'Space' switches to wireframe, 'b' toggles
 	  backface culling.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_LAYER
-	bool "usr/bin/df_layer"
+	bool "df_layer"
 	help
 	  Simple videoplayer with layers.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_MATRIX
-	bool "usr/bin/df_matrix"
+	bool "df_matrix"
 	help
 	  Testing SetMatrix() for free transforms.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_MATRIX_WATER
-	bool "usr/bin/df_matrix_water"
+	bool "df_matrix_water"
 	help
 	  Same as df_matrix, but using new Water API.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_NEO
-	bool "usr/bin/df_neo"
+	bool "df_neo"
 	help
 	  Port from a gdk-pixbuf demo to DirectFB, uses scaling,
 	  alpha blending and color modulation, use cursor keys and
 	  space to change parameters.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_NETLOAD
-	bool "usr/bin/df_netload"
+	bool "df_netload"
 	help
 	  Network statistica from /proc/net/dev.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_PALETTE
-	bool "usr/bin/df_palette"
+	bool "df_palette"
 	help
 	  A example blitting from a surface with a
 	  rotating/morphing palette.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_PARTICLE
-	bool "usr/bin/df_particle"
+	bool "df_particle"
 	help
 	  A moving fountain consisting of alphablended rectangles,
 	  nice and fast if hardware accelerated.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_PORTER
-	bool "usr/bin/df_porter"
+	bool "df_porter"
 	help
 	  Shows porter/duff blending rules.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_STRESS
-	bool "usr/bin/df_stress"
+	bool "df_stress"
 	help
 	  Stress tests surface manager, for debugging purposes only.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_TEXTURE
-	bool "usr/bin/df_texture"
+	bool "df_texture"
 	help
 	  A simple texture example. The 3d windows can be rotated
 	  with the mouse.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO
-	bool "usr/bin/df_video"
+	bool "df_video"
 	help
 	  Shows window stack with alpha blending and video playback
 	  in a moving window.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO_PARTICLE
-	bool "usr/bin/df_video_particle"
+	bool "df_video_particle"
 	help
 	  Same as df_particle, but the rectangles have been
 	  replaced by a video (via video4linux). Nice color effects.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_WINDOW
-	bool "usr/bin/df_window"
+	bool "df_window"
 	help
 	  Simple demonstration of the DirectFB window stack, follow
 	  the instructions in the upper left corner. Pass a video
