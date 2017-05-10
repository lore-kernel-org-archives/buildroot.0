From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 May 2017 23:32:18 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: add a number of packages to
	Matt Weber
Message-ID: <20170510213311.781727FA3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c270b4a4c064d9892f0bbe810bcd4f9ee598e467
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds Matt Weber as a developer for the libqmi, nginx-upload,
cgroupfs-mount, validjson and SELinux-related packages.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8fbb69a..13c72ed 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1070,22 +1070,32 @@ F:	package/ts4900-fpga/
 
 N:	Matt Weber <matthew.weber@rockwellcollins.com>
 F:	package/bc/
+F:	package/checkpolicy/
+F:	package/cgroupfs-mount/
 F:	package/eigen/
 F:	package/fmc/
 F:	package/fmlib/
 F:	package/igmpproxy/
 F:	package/iputils/
 F:	package/libcsv/
+F:	package/libselinux/
+F:	package/libsemanage/
+F:	package/libsepol/
+F:	package/libqmi/
+F:	package/nginx-upload/
 F:	package/omniorb/
+F:	package/policycoreutils/
 F:	package/python-ipy/
 F:	package/python-posix-ipc/
 F:	package/python-pypcap/
 F:	package/python-pyrex/
 F:	package/raptor/
+F:	package/sepolgen/
 F:	package/setools/
 F:	package/simicsfs/
 F:	package/smcroute/
 F:	package/tclap/
+F:	package/valijson/
 
 N:	Mauro Condarelli <mc5686@mclink.it>
 F:	package/mc/
