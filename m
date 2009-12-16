From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2009 16:41:36 +0100
Subject: [Buildroot] [git commit master] dependencies: remove useless test
	doing nothing
Message-ID: <20091216154216.A04FF777B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=84b1e44e92208c4be287dbdc1344f3df99f2fa39
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/dependencies/dependencies.sh |    7 -------
 1 files changed, 0 insertions(+), 7 deletions(-)

diff --git a/toolchain/dependencies/dependencies.sh b/toolchain/dependencies/dependencies.sh
index e503097..5c40f0d 100755
--- a/toolchain/dependencies/dependencies.sh
+++ b/toolchain/dependencies/dependencies.sh
@@ -11,13 +11,6 @@ export LC_ALL=C
 # check build system 'environment'
 #
 #############################################################
-if test -n "$BUILDROOT_DL_DIR" ; then
-	/bin/echo -e "Overriding \$(DL_DIR) in '.config'.		Ok"
-	/bin/echo -e "External download directory:			Ok ($BUILDROOT_DL_DIR)"
-else
-	echo "BUILDROOT_DL_DIR clean:				Ok"
-fi
-
 if test -n "$CC" ; then
 	echo "CC clean:						FALSE"
 	/bin/echo -e "\n\nYou must run 'unset CC' so buildroot can run with";
-- 
1.6.3.3
