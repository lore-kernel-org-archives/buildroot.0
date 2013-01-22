From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 22 Jan 2013 08:44:52 +0100
Subject: [Buildroot] [git commit] audiofile: fix license
Message-ID: <20130122074540.3134D9A723@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=045603fd65e73b4bcbec49e5d6e3eb052514cd18
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Somehow this didn't get committed in 1eb9845ad6 (add license information)

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/audiofile/audiofile.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/audiofile/audiofile.mk b/package/audiofile/audiofile.mk
index 504a81a..9886c4d 100644
--- a/package/audiofile/audiofile.mk
+++ b/package/audiofile/audiofile.mk
@@ -8,7 +8,7 @@ AUDIOFILE_VERSION = 0.3.4
 AUDIOFILE_SITE = http://audiofile.68k.org
 AUDIOFILE_INSTALL_STAGING = YES
 AUDIOFILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-AUDIOFILE_LICENSE = GPLv2 LGPLv2
+AUDIOFILE_LICENSE = GPLv2+ LGPLv2+
 AUDIOFILE_LICENSE_FILES = COPYING COPYING.GPL
 
 # Useless and needs alsa-lib
