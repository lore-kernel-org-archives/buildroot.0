From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Feb 2015 15:23:11 +0100
Subject: [Buildroot] [git commit] util-linux: setterm requires ncurses
Message-ID: <20150221142328.3A76A80448@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3986a99182fa4a6e3246a0e4a0f22ad94023bd5f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/7c0/7c02c0de18059bd1a633267b43a8a5e9ee2fdfdc/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/util-linux/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 1b475d4..a138a37 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -223,6 +223,7 @@ config BR2_PACKAGE_UTIL_LINUX_SETPRIV
 
 config BR2_PACKAGE_UTIL_LINUX_SETTERM
 	bool "setterm"
+	select BR2_PACKAGE_NCURSES
 	help
 	  Set terminal attributes
 
