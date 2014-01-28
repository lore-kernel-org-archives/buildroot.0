From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jan 2014 11:27:43 +0100
Subject: [Buildroot] [git commit] tcpreplay: Bump version to 4.0.2
Message-ID: <20140128102844.39CDC9C6A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a2ff491db36c613fbc84e3bf065d42d94399c086
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tcpreplay/tcpreplay.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index a2cd16e..fdb42a5 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPREPLAY_VERSION = 4.0.0
+TCPREPLAY_VERSION = 4.0.2
 TCPREPLAY_SITE = http://downloads.sourceforge.net/project/tcpreplay/tcpreplay/$(TCPREPLAY_VERSION)
 TCPREPLAY_LICENSE = GPLv3
 TCPREPLAY_LICENSE_FILES = docs/LICENSE
