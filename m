From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 22:05:14 +0100
Subject: [Buildroot] [git commit] audiofile: comma separate licenses
Message-ID: <20151215210845.3F53E80409@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=13a3cf66434304b37839f4b61746b6787b959bd0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/audiofile/audiofile.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/audiofile/audiofile.mk b/package/audiofile/audiofile.mk
index c685ce1..ee3f833 100644
--- a/package/audiofile/audiofile.mk
+++ b/package/audiofile/audiofile.mk
@@ -12,7 +12,7 @@ AUDIOFILE_CONF_OPTS = --disable-examples
 AUDIOFILE_DEPENDENCIES = host-pkgconf
 # configure is outdated and has old bugs because of it
 AUDIOFILE_AUTORECONF = YES
-AUDIOFILE_LICENSE = GPLv2+ LGPLv2.1+
+AUDIOFILE_LICENSE = GPLv2+, LGPLv2.1+
 AUDIOFILE_LICENSE_FILES = COPYING COPYING.GPL
 
 ifeq ($(BR2_PACKAGE_FLAC),y)
