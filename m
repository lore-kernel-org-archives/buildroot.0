From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 May 2017 17:24:17 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: add selinux packages under
	Adam Duskett
Message-ID: <20170527152450.698A681F6D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e0a787669124d0ae1da81739f3fb7eabba272fb4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4d43358..37f2fb8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -30,9 +30,17 @@ N:	Abhilash Tuse <abhilash.tuse@imgtec.com>
 F:	package/gstreamer1/gst1-rtsp-server/
 
 N:	Adam Duskett <aduskett@gmail.com>
+F:	package/audit/
+F:	package/checkpolicy/
 F:	package/gstreamer1/gst1-vaapi/
+F:	package/libselinux/
+F:	package/libsemanage/
+F:	package/libsepol/
 F:	package/nginx-naxsi/
+F:	package/policycoreutils/
 F:	package/python-mutagen/
+F:	package/sepolgen/
+F:	package/setools/
 F:	package/sngrep/
 
 N:	Alex Suykov <alex.suykov@gmail.com>
