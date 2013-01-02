From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  2 Jan 2013 12:26:36 +0100
Subject: [Buildroot] [PATCH 01/20] xapp_xinput-calibrator: rename directory
	to match .mk name
In-Reply-To: <cover.1357125961.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357125961.git.thomas.petazzoni@free-electrons.com>
Message-ID: <cdd5556b67ab27d5e33b73f3c487add506513a8b.1357125961.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The directory was named xapp_xinput_calibrator, but the .mk file was
named xapp_xinput-calibrator.mk, which isn't consistent. Rename the
directory to xapp_xinput-calibrator to be consistent with the naming
of the .mk file and the other x11r7 directories.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/Config.in                            |    2 +-
 .../Config.in                                      |    0
 .../xapp_xinput-calibrator.mk                      |    0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename package/x11r7/{xapp_xinput_calibrator => xapp_xinput-calibrator}/Config.in (100%)
 rename package/x11r7/{xapp_xinput_calibrator => xapp_xinput-calibrator}/xapp_xinput-calibrator.mk (100%)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 94ad8a4..6881d4e 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -132,7 +132,7 @@ endmenu
 		source package/x11r7/xapp_xhost/Config.in
 		source package/x11r7/xapp_xinit/Config.in
 		source package/x11r7/xapp_xinput/Config.in
-		source package/x11r7/xapp_xinput_calibrator/Config.in
+		source package/x11r7/xapp_xinput-calibrator/Config.in
 		source package/x11r7/xapp_xkbcomp/Config.in
 		source package/x11r7/xapp_xkbevd/Config.in
 		source package/x11r7/xapp_xkbprint/Config.in
diff --git a/package/x11r7/xapp_xinput_calibrator/Config.in b/package/x11r7/xapp_xinput-calibrator/Config.in
similarity index 100%
rename from package/x11r7/xapp_xinput_calibrator/Config.in
rename to package/x11r7/xapp_xinput-calibrator/Config.in
diff --git a/package/x11r7/xapp_xinput_calibrator/xapp_xinput-calibrator.mk b/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.mk
similarity index 100%
rename from package/x11r7/xapp_xinput_calibrator/xapp_xinput-calibrator.mk
rename to package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.mk
-- 
1.7.9.5
