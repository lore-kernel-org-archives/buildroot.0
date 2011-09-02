From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  2 Sep 2011 11:04:54 -0300
Subject: [Buildroot] [PATCH 06/13] libsamplerate: bump to version 0.1.8
In-Reply-To: <1314972301-5067-1-git-send-email-gustavo@zacarias.com.ar>
References: <1314972301-5067-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1314972301-5067-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/libsamplerate/libsamplerate.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/libsamplerate/libsamplerate.mk b/package/multimedia/libsamplerate/libsamplerate.mk
index 94b07a4..f20026a 100644
--- a/package/multimedia/libsamplerate/libsamplerate.mk
+++ b/package/multimedia/libsamplerate/libsamplerate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSAMPLERATE_VERSION = 0.1.7
+LIBSAMPLERATE_VERSION = 0.1.8
 LIBSAMPLERATE_SITE = http://www.mega-nerd.com/SRC
 LIBSAMPLERATE_INSTALL_STAGING = YES
 LIBSAMPLERATE_DEPENDENCIES = host-pkg-config
-- 
1.7.3.4
