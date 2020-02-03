From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Feb 2020 18:17:02 +0100
Subject: [Buildroot] [git commit] package/jack2: bump to version 1.9.14
Message-ID: <20200203171038.3EA0188DC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f22eaec0c0ca7253b847b6610c83d45d3ddf53d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Amongst other things, the jack2 waf script has been made
compatible with Python3 in this latest release, which makes
it possible to be built on py3

See also upstream release notes:
- https://github.com/jackaudio/jack2/releases/tag/v1.9.13
- https://github.com/jackaudio/jack2/releases/tag/v1.9.14

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jack2/jack2.hash | 2 +-
 package/jack2/jack2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jack2/jack2.hash b/package/jack2/jack2.hash
index f6f2345eb5..aec56e24a4 100644
--- a/package/jack2/jack2.hash
+++ b/package/jack2/jack2.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 deefe2f936dc32f59ad3cef7e37276c2035ef8a024ca92118f35c9a292272e33  jack2-1.9.12.tar.gz
+sha256 a20a32366780c0061fd58fbb5f09e514ea9b7ce6e53b080a44b11a558a83217c  jack2-1.9.14.tar.gz
diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index c4cad32ed6..b08c45cce7 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JACK2_VERSION = 1.9.12
+JACK2_VERSION = 1.9.14
 JACK2_SITE = $(call github,jackaudio,jack2,v$(JACK2_VERSION))
 JACK2_LICENSE = GPL-2.0+ (jack server), LGPL-2.1+ (jack library)
 JACK2_DEPENDENCIES = libsamplerate libsndfile alsa-lib host-python
