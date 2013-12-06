From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Dec 2013 09:31:53 +0100
Subject: [Buildroot] [git commit] opus: bump version, add license info
Message-ID: <20131206084200.E36679BF47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=75cc6b7b69678cfb333ed766905b3654253139f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opus/opus.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/opus/opus.mk b/package/opus/opus.mk
index 9668854..00181de 100644
--- a/package/opus/opus.mk
+++ b/package/opus/opus.mk
@@ -4,8 +4,10 @@
 #
 ################################################################################
 
-OPUS_VERSION = 1.0.3
+OPUS_VERSION = 1.1
 OPUS_SITE = http://downloads.xiph.org/releases/opus
+OPUS_LICENSE = BSD-3c
+OPUS_LICENSE_FILES = COPYING
 OPUS_INSTALL_STAGING = YES
 OPUS_CONF_OPT = --disable-doc
 
