From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Jan 2014 23:02:05 +0100
Subject: [Buildroot] [git commit] gettext: bump to version 0.18.3.2
Message-ID: <20140110220358.1869F9C3D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d00f36c9dcf609ea642e072593bfe23ab09c44a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gettext/gettext.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 4874a82..fbdb19c 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GETTEXT_VERSION = 0.18.3.1
+GETTEXT_VERSION = 0.18.3.2
 GETTEXT_SITE = $(BR2_GNU_MIRROR)/gettext
 GETTEXT_INSTALL_STAGING = YES
 GETTEXT_LICENSE = GPLv2+
