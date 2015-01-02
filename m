From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Jan 2015 12:02:55 +0100
Subject: [Buildroot] [git commit] libsemanage: change to github location
Message-ID: <20150102110711.2341C80828@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fa7281adaf5a66eaaa32fc3340375556aff42e92
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The old location doesn't seem active any more. Even though this github URL
looks a bit odd, it is linked from
https://github.com/SELinuxProject/selinux/wiki/Releases

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsemanage/libsemanage.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index 4813430..17e8fea 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSEMANAGE_VERSION = 2.1.10
-LIBSEMANAGE_SITE = http://userspace.selinuxproject.org/releases/20130423/
+LIBSEMANAGE_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20130423
 LIBSEPOL_LICENSE = LGPLv2.1+
 LIBSEPOL_LICENSE_FILES = COPYING
 
