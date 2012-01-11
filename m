From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 11 Jan 2012 18:35:41 +0100
Subject: [Buildroot] [git commit] Update the CHANGES file to mention this
	new policy
Message-ID: <20120111173831.6770A902FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=234dd8e6a2ce006283a5419f457973c3336558ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 1dc1f36..8f6870b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -13,6 +13,9 @@
 
 	Bootloaders: U-Boot: add 2011.12, remove 2010.xx versions.
 
+	Buildroot now calls the stop function of scripts in /etc/init.d at
+	shutdown.
+
 	Updated/fixed packages: barebox, bash, beecrypt, binutils,
 	bison, busybox, cdrkit, coreutils, dbus-glib, diffutils,
 	dropbear, ebtables, ethtool, ffmpeg, flex, fluxbox, gawk,
