From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 23 May 2012 10:29:37 -0300
Subject: [Buildroot] [PATCH 5/7] audiofile: bump to version 0.3.4
In-Reply-To: <1337779779-1783-1-git-send-email-gustavo@zacarias.com.ar>
References: <1337779779-1783-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1337779779-1783-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/audiofile/audiofile.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/audiofile/audiofile.mk b/package/audiofile/audiofile.mk
index a49cc3e..5f09f95 100644
--- a/package/audiofile/audiofile.mk
+++ b/package/audiofile/audiofile.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-AUDIOFILE_VERSION = 0.3.3
+AUDIOFILE_VERSION = 0.3.4
 AUDIOFILE_SITE = http://audiofile.68k.org
 AUDIOFILE_INSTALL_STAGING = YES
 AUDIOFILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-- 
1.7.3.4
