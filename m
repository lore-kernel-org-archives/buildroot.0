From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Aug 2017 22:13:51 +0200
Subject: [Buildroot] [git commit] package/opus: bump version to 1.2.1
Message-ID: <20170902130620.8F8728016A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c05010395dd08f9f6eddd3863a128f19e0100a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch upstream URL to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opus/opus.hash | 2 +-
 package/opus/opus.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/opus/opus.hash b/package/opus/opus.hash
index 7349ec4..32fe2e2 100644
--- a/package/opus/opus.hash
+++ b/package/opus/opus.hash
@@ -1,2 +1,2 @@
 # From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
-sha256	9122b6b380081dd2665189f97bfd777f04f92dc3ab6698eea1dbb27ad59d8692	opus-1.1.4.tar.gz
+sha256 cfafd339ccd9c5ef8d6ab15d7e1a412c054bf4cb4ecbbbcc78c12ef2def70732  opus-1.2.1.tar.gz
diff --git a/package/opus/opus.mk b/package/opus/opus.mk
index b810b77..44de5db 100644
--- a/package/opus/opus.mk
+++ b/package/opus/opus.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-OPUS_VERSION = 1.1.4
-OPUS_SITE = http://downloads.xiph.org/releases/opus
+OPUS_VERSION = 1.2.1
+OPUS_SITE = https://downloads.xiph.org/releases/opus
 OPUS_LICENSE = BSD-3-Clause
 OPUS_LICENSE_FILES = COPYING
 OPUS_INSTALL_STAGING = YES
