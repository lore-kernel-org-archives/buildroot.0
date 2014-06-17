From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Jun 2014 16:43:26 -0300
Subject: [Buildroot] [PATCH] vlc: security bump to version 2.1.4
Message-ID: <1403034206-17578-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2014-1684: The ASF_ReadObject_file_properties function in
modules/demux/asf/libasf.c in the ASF Demuxer in VideoLAN VLC Media
Player before 2.1.3 allows remote attackers to cause a denial of service
(divide-by-zero error and crash) via a zero minimum and maximum data
packet size in an ASF file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/vlc/vlc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 6eb7eea..6c4677a 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VLC_VERSION = 2.1.2
+VLC_VERSION = 2.1.4
 VLC_SITE = http://download.videolan.org/pub/videolan/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPLv2+ LGPLv2.1+
-- 
1.8.5.5
