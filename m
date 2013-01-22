From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 22 Jan 2013 08:17:02 -0300
Subject: [Buildroot] [PATCH 3/3] mpd: bump to version 0.17.3
In-Reply-To: <1358853422-24670-1-git-send-email-gustavo@zacarias.com.ar>
References: <1358853422-24670-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1358853422-24670-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/mpd/mpd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/multimedia/mpd/mpd.mk b/package/multimedia/mpd/mpd.mk
index ab3a357..5fbc8f6 100644
--- a/package/multimedia/mpd/mpd.mk
+++ b/package/multimedia/mpd/mpd.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-MPD_VERSION = 0.17.2
+MPD_VERSION = 0.17.3
 MPD_SITE = http://downloads.sourceforge.net/project/musicpd/mpd/$(MPD_VERSION)
 MPD_DEPENDENCIES = host-pkgconf libglib2
 MPD_LICENSE = GPLv2
-- 
1.7.12.4
