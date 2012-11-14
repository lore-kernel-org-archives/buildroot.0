From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Nov 2012 22:37:19 +0100
Subject: [Buildroot] [git commit] procps: add license info
Message-ID: <20121114214733.6F9C699B26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4f837674385f0bfa516c08195b2f28da3c4b1cce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/procps/procps.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/procps/procps.mk b/package/procps/procps.mk
index ced04a4..189da1f 100644
--- a/package/procps/procps.mk
+++ b/package/procps/procps.mk
@@ -6,6 +6,8 @@
 
 PROCPS_VERSION = 3.2.8
 PROCPS_SITE = http://procps.sourceforge.net/
+PROCPS_LICENSE = GPLv2+, libproc and libps LGPLv2+
+PROCPS_LICENSE_FILES = COPYING COPYING.LIB
 
 PROCPS_DEPENDENCIES = ncurses
 
