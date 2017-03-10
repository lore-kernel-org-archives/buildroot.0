From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Mar 2017 12:37:14 +0100
Subject: [Buildroot] [git commit] Update for 2016.11.3
Message-ID: <20170310113721.5E1CD80251@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e77a5c881c463d399e35a215ab124a448a13e526
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Peter: drop Makefile changes]
(cherry picked from commit cf01d69e1b7bf6b4e31d7f7bab646365f75394d5)
---
 CHANGES | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/CHANGES b/CHANGES
index 5fedca1..64179a2 100644
--- a/CHANGES
+++ b/CHANGES
@@ -156,6 +156,14 @@
 	#9576: External tree with BR 2016.11 does not work anymore
 	#9606: xorg-server cannot build for ARM target
 
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
