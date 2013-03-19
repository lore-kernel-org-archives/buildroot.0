From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 19 Mar 2013 17:04:59 +0100
Subject: [Buildroot] [git commit] sudo: security bump to version 1.8.6p7
Message-ID: <20130319160721.CEF419B1A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=765e6bb3b09f469c23c98ae391f72c7f1256cd62
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2013-1775 and CVE-2013-1776.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sudo/sudo.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index a01ac0c..5fd3c61 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SUDO_VERSION = 1.8.6p4
+SUDO_VERSION = 1.8.6p7
 SUDO_SITE    = http://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ICS BSD-3c
 SUDO_LICENSE_FILES = doc/LICENSE
