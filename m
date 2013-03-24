From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 16:15:56 +0100
Subject: [Buildroot] [git commit] iproute2: add missing host-flex dependency
Message-ID: <20130324151610.5B8839B26D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=87827beff7f26fd3cee64a4952d973e207332469
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.org/results/0931e622a0e80fc7321f0e26c96ae4607eaadd00/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/iproute2/iproute2.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 98a7da0..a83133b 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -10,7 +10,7 @@ IPROUTE2_TARGET_SBINS = ctstat genl ifstat ip lnstat nstat routef routel rtacct
 IPROUTE2_LICENSE = GPLv2
 IPROUTE2_LICENSE_FILES = COPYING
 
-IPROUTE2_DEPENDENCIES += host-bison
+IPROUTE2_DEPENDENCIES += host-bison host-flex
 
 # If both iproute2 and busybox are selected, make certain we win
 # the fight over who gets to have their utils actually installed.
