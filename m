From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Oct 2019 22:08:59 +0200
Subject: [Buildroot] [git commit] package/selinux-python: add missing empty
 line before URL
Message-ID: <20191010201354.B12588C952@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe93c760ddadcc7784c316d8ea7deb6830abb20d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/selinux-python/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/selinux-python/Config.in b/package/selinux-python/Config.in
index 2013bd6445..5e44b5deb0 100644
--- a/package/selinux-python/Config.in
+++ b/package/selinux-python/Config.in
@@ -9,6 +9,7 @@ menuconfig BR2_PACKAGE_SELINUX_PYTHON
 	  A set of SELinux tools written in python that help with
 	  managing a system with SELinux enabled. If no packages are
 	  selected nothing will actually be built.
+
 	  https://github.com/SELinuxProject/selinux/wiki
 
 if BR2_PACKAGE_SELINUX_PYTHON
