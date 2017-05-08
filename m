From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon,  8 May 2017 11:52:31 -0500
Subject: [Buildroot] [PATCH 2/5] DEVELOPERS: add Matt Weber -> selinux pkgs
In-Reply-To: <1494262354-51074-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1494262354-51074-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1494262354-51074-2-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 DEVELOPERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 63b111f..3ba9704 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1070,19 +1070,25 @@ F:	package/ts4900-fpga/
 
 N:	Matt Weber <matthew.weber@rockwellcollins.com>
 F:	package/bc/
+F:	package/checkpolicy/
 F:	package/eigen/
 F:	package/fmc/
 F:	package/fmlib/
 F:	package/igmpproxy/
 F:	package/iputils/
 F:	package/libcsv/
+F:	package/libselinux/
+F:	package/libsemanage/
+F:	package/libsepol/
 F:	package/libqmi/
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
-- 
1.9.1
