From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 22:35:13 +0200
Subject: [Buildroot] [git commit] ngircd: needs mmu
Message-ID: <20131009203638.289DD9B9A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b4308639807b98791780adb383cf20f6dad1d0b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ngircd/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/ngircd/Config.in b/package/ngircd/Config.in
index e8fc3d0..f1d8bea 100644
--- a/package/ngircd/Config.in
+++ b/package/ngircd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NGIRCD
 	bool "ngircd"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_ZLIB
 	help
 	  Next Generation IRC server deamon.
