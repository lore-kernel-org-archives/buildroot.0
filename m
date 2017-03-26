From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Mar 2017 22:49:31 +0200
Subject: [Buildroot] [git commit] dbus-triggerd: add license file
Message-ID: <20170326205041.E3847818A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=50284570fbefa37c8874b47cd5998bd890e54632
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In absence of license file, use source file as a license file since it
has license header in comments.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dbus-triggerd/dbus-triggerd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dbus-triggerd/dbus-triggerd.mk b/package/dbus-triggerd/dbus-triggerd.mk
index 48d5fb2..0d693b4 100644
--- a/package/dbus-triggerd/dbus-triggerd.mk
+++ b/package/dbus-triggerd/dbus-triggerd.mk
@@ -7,6 +7,7 @@
 DBUS_TRIGGERD_VERSION = ba3dbec805cb707c94c54de21666bf18b79bcc09
 DBUS_TRIGGERD_SITE = git://rg42.org/dbustriggerd.git
 DBUS_TRIGGERD_LICENSE = GPLv2+
+DBUS_TRIGGERD_LICENSE_FILES = dbus-triggerd.c
 DBUS_TRIGGERD_DEPENDENCIES = host-pkgconf dbus
 
 define DBUS_TRIGGERD_BUILD_CMDS
