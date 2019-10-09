From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 10 Oct 2019 00:06:38 +0200
Subject: [Buildroot] [PATCH 1/4] package/selinux-python: add missing empty
 line before URL
Message-ID: <20191009220641.24605-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/selinux-python/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/selinux-python/Config.in b/package/selinux-python/Config.in
index 3b6eff88af..2e314cb60d 100644
--- a/package/selinux-python/Config.in
+++ b/package/selinux-python/Config.in
@@ -9,6 +9,7 @@ menuconfig BR2_PACKAGE_SELINUX_PYTHON
 	  A set of SELinux tools written in python that help with
 	  managing a system with SELinux enabled. If no packages are
 	  selected nothing will actually be built.
+
 	  https://github.com/SELinuxProject/selinux/wiki
 
 if BR2_PACKAGE_SELINUX_PYTHON
-- 
2.21.0
