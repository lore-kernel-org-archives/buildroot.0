From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Oct 2014 22:39:36 +0100
Subject: [Buildroot] [git commit] libunistring: move at the right location
	in menuconfig
Message-ID: <20141027214014.790B7B19E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=97a49b8133818d83a20d5a236ec2e778a70ba6ec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It should be in "Libraries" -> "Text" instead of "Libraries" ->
"Other", and also entries should be sorted alphabetically.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 8865c1e..4f16a39 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -909,7 +909,6 @@ menu "Other"
 	source "package/startup-notification/Config.in"
 	source "package/tz/Config.in"
 	source "package/tzdata/Config.in"
-	source "package/libunistring/Config.in"
 endmenu
 
 menu "Security"
@@ -924,6 +923,7 @@ menu "Text and terminal handling"
 	source "package/libestr/Config.in"
 	source "package/libfribidi/Config.in"
 	source "package/libiconv/Config.in"
+	source "package/libunistring/Config.in"
 	source "package/linenoise/Config.in"
 	source "package/ncurses/Config.in"
 	source "package/newt/Config.in"
