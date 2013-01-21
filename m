From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 21 Jan 2013 18:29:43 -0300
Subject: [Buildroot] [PATCH 03/10] audiofile: add license information
In-Reply-To: <1358803790-30245-1-git-send-email-gustavo@zacarias.com.ar>
References: <1358803790-30245-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1358803790-30245-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/audiofile/audiofile.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/audiofile/audiofile.mk b/package/audiofile/audiofile.mk
index 1c6e6de..504a81a 100644
--- a/package/audiofile/audiofile.mk
+++ b/package/audiofile/audiofile.mk
@@ -8,6 +8,8 @@ AUDIOFILE_VERSION = 0.3.4
 AUDIOFILE_SITE = http://audiofile.68k.org
 AUDIOFILE_INSTALL_STAGING = YES
 AUDIOFILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
+AUDIOFILE_LICENSE = GPLv2 LGPLv2
+AUDIOFILE_LICENSE_FILES = COPYING COPYING.GPL
 
 # Useless and needs alsa-lib
 define AUDIOFILE_DISABLE_EXAMPLES
-- 
1.7.12.4
