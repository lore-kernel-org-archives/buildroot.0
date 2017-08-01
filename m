From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Aug 2017 23:40:09 +0200
Subject: [Buildroot] [git commit] CHANGES: update after binutils changes
Message-ID: <20170801213610.2254F802AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca74790030e4eec04e25a633e23400c2d89fc89c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/CHANGES b/CHANGES
index f647953..e31fd7a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -66,6 +66,8 @@
 
 	- Switch to gcc 6.x as the default gcc version, add support
 	  for gcc 7.x, remove support for gcc 4.8
+	- Switch to binutils 2.28 as the default binutils version, add
+	  support for binutils 2.29, remove support for binutils 2.26
 	- Support added for gdb 8.0
 	- uClibc-ng bumped to 1.0.26
 	- CodeSourcery toolchains for x86 and SuperH have been
