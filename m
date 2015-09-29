From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Sep 2015 19:46:00 +0200
Subject: [Buildroot] [git commit] libssh: remove an extra '#' sign in the
	header package name
Message-ID: <20150929174639.95FD181D5B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=298e2909b024a0a3dcd143ab79fb4971637571f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libssh/libssh.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index ded5e8c..68438b9 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-## libssh
+# libssh
 #
 ################################################################################
 
