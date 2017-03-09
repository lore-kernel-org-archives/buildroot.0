From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Mar 2017 00:00:07 +0100
Subject: [Buildroot] [git commit branch/2016.11.x] Update for 2016.11.3
Message-ID: <20170309230045.4EA7981E93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf01d69e1b7bf6b4e31d7f7bab646365f75394d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2016.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 8 ++++++++
 Makefile | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index ec749a1..9bc198d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,11 @@
+2016.11.3, Released March 9th, 2017
+
+	Important / security related fixes.
+
+	Updated/fixed packages: bind, dbus, gnutls, imagemagick,
+	lcms2, libcurl, ntfs-3g, ntp, openssl, php, quagga, redis,
+	squid, stunnel, tcpdump, vim, wavpack, wireshark, xlib_libXpm
+
 2016.11.2, Released January 25th, 2017
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 1d119ae..b4a8ed9 100644
--- a/Makefile
+++ b/Makefile
@@ -83,7 +83,7 @@ else # umask / $(CURDIR) / $(O)
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2016.11.2
+export BR2_VERSION := 2016.11.3
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
