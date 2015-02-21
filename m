From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Feb 2015 15:23:22 +0100
Subject: [Buildroot] [git commit] util-linux: ul also requires ncurses
Message-ID: <20150221142328.49B2F80448@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=59abbae847f2caddc00e9f7d4c97a8fe184035a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Found via auditing.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/util-linux/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index a138a37..bc6c791 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -234,6 +234,7 @@ config BR2_PACKAGE_UTIL_LINUX_SWITCH_ROOT
 
 config BR2_PACKAGE_UTIL_LINUX_UL
 	bool "ul"
+	select BR2_PACKAGE_NCURSES
 	help
 	  Do underlining
 
