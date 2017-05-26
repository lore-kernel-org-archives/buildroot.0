From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 26 May 2017 08:10:46 -0400
Subject: [Buildroot] [PATCH 1/1] Developers: Add selinux packages under Adam
	Duskett
Message-ID: <20170526121046.20967-1-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 DEVELOPERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4d43358..083d84f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -30,9 +30,17 @@ N:	Abhilash Tuse <abhilash.tuse@imgtec.com>
 F:	package/gstreamer1/gst1-rtsp-server/
 
 N:	Adam Duskett <aduskett@gmail.com>
+F:  package/audit/
+F:  package/checkpolicy
 F:	package/gstreamer1/gst1-vaapi/
+F:  package/libselinux/
+F:  package/libsemanage/
+F:  package/libsepol/
 F:	package/nginx-naxsi/
+F:  package/policycoreutils/
 F:	package/python-mutagen/
+F:  package/sepolgen/
+F:  package/setools
 F:	package/sngrep/
 
 N:	Alex Suykov <alex.suykov@gmail.com>
-- 
2.9.4
