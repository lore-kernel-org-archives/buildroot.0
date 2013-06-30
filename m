From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 30 Jun 2013 18:04:21 +0200
Subject: [Buildroot] [git commit] axel: fix download URL
Message-ID: <20130630160811.1334196C81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=695bd9efe1a10ddb7d963713a26bafcd7ebe9ddf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/axel/axel.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index e8fa756..e8be1a6 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -6,7 +6,7 @@
 
 AXEL_VERSION = 2.4
 AXEL_SOURCE = axel-$(AXEL_VERSION).tar.gz
-AXEL_SITE = https://alioth.debian.org/frs/download.php/3015
+AXEL_SITE = https://alioth.debian.org/frs/download.php/file/3015
 AXEL_LICENSE = GPLv2+
 AXEL_LICENSE_FILES = COPYING
 
