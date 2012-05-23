From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 23 May 2012 22:26:00 +0200
Subject: [Buildroot] [git commit] audiofile: bump to version 0.3.4
Message-ID: <20120531113300.93ACA96E2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=50ed5342a1a7e9d22b35a30d2a897cd4752930e7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
