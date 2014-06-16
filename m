From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Jun 2014 09:46:02 +0200
Subject: [Buildroot] [git commit] fmlib: only show comment if we're on a
	suitable arch
Message-ID: <20140616075430.E3A6D9CFE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d85c7f6129985f49603e348a0672f5eafbe0d616
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fmlib/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/fmlib/Config.in b/package/fmlib/Config.in
index f9b09c6..3cc6a2b 100644
--- a/package/fmlib/Config.in
+++ b/package/fmlib/Config.in
@@ -1,4 +1,5 @@
 comment "fmlib needs a Linux kernel to be built"
+	depends on BR2_powerpc_e500mc
 	depends on !BR2_LINUX_KERNEL
 
 config BR2_PACKAGE_FMLIB
