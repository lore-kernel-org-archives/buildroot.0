From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 19:18:27 +0200
Subject: [Buildroot] [git commit] libsysfs: fix Config.in help text
	indentation
Message-ID: <20170731171429.2FB5F81F7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f4c087b782d7da5b8656e1ade81f29c83410fa60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsysfs/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsysfs/Config.in b/package/libsysfs/Config.in
index 134812e..2cbebaa 100644
--- a/package/libsysfs/Config.in
+++ b/package/libsysfs/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_LIBSYSFS
 	  These are a set of utilities built upon sysfs, a filesystem in
 	  Linux 2.6 kernels that exposes a system's device tree.
 
-	http://linux-diag.sourceforge.net/Sysfsutils.html
+	  http://linux-diag.sourceforge.net/Sysfsutils.html
