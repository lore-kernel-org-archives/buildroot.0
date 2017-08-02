From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 22:23:00 +0200
Subject: [Buildroot] [git commit] CHANGES: update with gcc 7.x graphite
	optimization bug fixed
Message-ID: <20170802201905.DE770821EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=90a1b819312af78846b981ad8df2aa432e8df2b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/CHANGES b/CHANGES
index 981a5a5..090b442 100644
--- a/CHANGES
+++ b/CHANGES
@@ -156,6 +156,8 @@
 	#10061: gcc5.4 buildroot toolchain for powerpc libsanitizer
 		failure
 	#10076: Makefile:4113: recipe for target 'all-gcc'  failed
+	#10091: gcc7.1 does not build with graphite support due to old
+		isl
 	#10121: webkit without the multimedia option causes build
 		error
 
