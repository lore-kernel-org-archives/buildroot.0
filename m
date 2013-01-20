From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 Jan 2013 20:33:05 +0100
Subject: [Buildroot] [git commit] axel: add license informations
Message-ID: <20130120202429.927B47FDE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a5ea6e6ac182586d75754c3fdfaf8a7ea7fab8ef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/axel/axel.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index 0ed8ad2..f823b4a 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -6,6 +6,8 @@
 AXEL_VERSION = 2.4
 AXEL_SOURCE = axel-$(AXEL_VERSION).tar.gz
 AXEL_SITE = https://alioth.debian.org/frs/download.php/3015
+AXEL_LICENSE = GPLv2+
+AXEL_LICENSE_FILES = COPYING
 
 AXEL_LDFLAGS = -lpthread
 
