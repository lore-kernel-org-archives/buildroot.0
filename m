From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 22:49:54 +0200
Subject: [Buildroot] [git commit] CHANGES: final update before 2017.08-rc1
Message-ID: <20170802204553.B5B1B81F6C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c472d8a4b90989862108cc2ae6ad6a705858dc45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index 090b442..8669485 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2017.08-rc1, To be released
+2017.08-rc1, Released August 2nd, 2017
 
 	Infrastructure:
 
@@ -155,6 +155,7 @@
 	#10056: No .config file was produced in /buildroot folder
 	#10061: gcc5.4 buildroot toolchain for powerpc libsanitizer
 		failure
+	#10071: fakeroot: replace hard-coded paths in post install
 	#10076: Makefile:4113: recipe for target 'all-gcc'  failed
 	#10091: gcc7.1 does not build with graphite support due to old
 		isl
