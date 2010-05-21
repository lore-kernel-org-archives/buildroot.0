From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 21 May 2010 21:11:06 +0200
Subject: [Buildroot] [git commit master] CHANGES: #1729 is now closed (fltk)
Message-ID: <20100521191218.F374D8D3DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7ab3f96e961b3837a22cceb7feb9c5c351646484
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index ff1089a..75da2fd 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,7 +2,7 @@
 
 	Fixes all over the tree.
 
-	Updated/fixed packages: aumix, avahi, busybox, cairo, gettext,
+	Updated/fixed packages: aumix, avahi, busybox, cairo, fltk, gettext,
 	gmpc, grep, hal, iconv, libcgicc, libglib2, libidn, libmpd,
 	libpcap, libsoup, lmbench, ltrace, lvm2, make, mtd-utils,
 	mutt, netsnmp, ntp, pango, php, psmisc, qt, samba, sshfs,
@@ -11,6 +11,7 @@
 	Issues resolved (http://bugs.uclibc.org):
 
 	#1693: NTP trys IPV6 even if not configured error: 'IPV6_MULTICAST...
+	#1729: alsamixergui fails to build
 	#1801: Avahi-autoipd doesn't create TARGET_DIR/var/lib
 
 2010.05-rc2, Released May 11th, 2010:
-- 
1.6.3.3
