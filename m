From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 16:06:27 +0200
Subject: [Buildroot] [git commit] eclipse-register-toolchain: toolchain is
	no longer installed in $(HOST_DIR)/usr
Message-ID: <20170705141335.BA55F7FB34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4db7d1f355048df231c5733910437b27e5363107
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/eclipse-register-toolchain | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/eclipse-register-toolchain b/support/scripts/eclipse-register-toolchain
index 6f91998..891d29e 100755
--- a/support/scripts/eclipse-register-toolchain
+++ b/support/scripts/eclipse-register-toolchain
@@ -45,7 +45,7 @@ if test ! -d ${project_directory}/host ; then
     exit 1
 fi
 
-if test ! -e ${project_directory}/host/usr/bin/${toolchain_prefix}gcc ; then
+if test ! -e ${project_directory}/host/bin/${toolchain_prefix}gcc ; then
     echo "Cannot find the cross-compiler in the project directory"
     exit 1
 fi
