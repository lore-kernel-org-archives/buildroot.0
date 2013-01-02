From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 2 Jan 2013 20:28:27 +0100
Subject: [Buildroot] [git commit] xapp_xinput-calibrator: rename directory
	to match .mk name
Message-ID: <20130102200335.7030F9A5C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fbe02c09377ed468ca03e7502c7e32c6071293ed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The directory was named xapp_xinput_calibrator, but the .mk file was
named xapp_xinput-calibrator.mk, which isn't consistent. Rename the
directory to xapp_xinput-calibrator to be consistent with the naming
of the .mk file and the other x11r7 directories.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/Config.in                            |    2 +-
 .../Config.in                                      |    0
 .../xapp_xinput-calibrator.mk                      |    0
 3 files changed, 1 insertions(+), 1 deletions(-)

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
