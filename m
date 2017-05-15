From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 14:04:37 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/vlc: security
	bump to version 2.2.5.1
Message-ID: <20170515125327.C85C082901@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b58f1ee7268e528b024ec57f32823ee2615dbba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

This release contains "various security improvements in demuxers and
decoders".
Release notes: http://www.videolan.org/vlc/releases/2.2.5.html

Added all hashes provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit c04fa8fad0e7d6631b00e8e0766244cc04a8364b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vlc/vlc.hash | 8 ++++++--
 package/vlc/vlc.mk   | 2 +-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
index efd4e27..0f1b6dc 100644
--- a/package/vlc/vlc.hash
+++ b/package/vlc/vlc.hash
@@ -1,2 +1,6 @@
-# From http://download.videolan.org/pub/videolan/vlc/2.2.3/vlc-2.2.3.tar.xz.sha256
-sha256 1632e91d2a0087e0ef4c3fb4c95c3c2890f7715a9d1d43ffd46329f428cf53be  vlc-2.2.4.tar.xz
+# From http://get.videolan.org/vlc/2.2.5.1/vlc-2.2.5.1.tar.xz.md5
+md5 7ab63964ffec4c92a54deb018f23318b vlc-2.2.5.1.tar.xz
+# From http://get.videolan.org/vlc/2.2.5.1/vlc-2.2.5.1.tar.xz.sha1
+sha1 042962dba68e1414aa563883b0172ee121cf9555 vlc-2.2.5.1.tar.xz
+# From http://get.videolan.org/vlc/2.2.5.1/vlc-2.2.5.1.tar.xz.sha256
+sha256 b28b8a28f578c0c6cb1ebed293aca2a3cd368906cf777d1ab599e2784ddda1cc vlc-2.2.5.1.tar.xz
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 583edf3..7f0c4f5 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VLC_VERSION = 2.2.4
+VLC_VERSION = 2.2.5.1
 VLC_SITE = http://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPLv2+, LGPLv2.1+
