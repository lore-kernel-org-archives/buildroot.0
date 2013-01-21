From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 Jan 2013 23:46:33 +0100
Subject: [Buildroot] [git commit] audiofile: add license information
Message-ID: <20130121225447.549F89A6BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1eb9845ad62c5e224ba736c8c8ad7640dfd79899
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: License is GPLv2+ LGPLv2+]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/audiofile/audiofile.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
