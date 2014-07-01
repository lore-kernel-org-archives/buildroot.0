From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 23:38:08 +0200
Subject: [Buildroot] [git commit] libev: add license information
Message-ID: <20140701224921.EBA439D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=593f75536a787f1fbd135587a67f31ae41239c71
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libev/libev.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libev/libev.mk b/package/libev/libev.mk
index 1742231..11c788d 100644
--- a/package/libev/libev.mk
+++ b/package/libev/libev.mk
@@ -7,5 +7,7 @@
 LIBEV_VERSION = 4.11
 LIBEV_SITE = http://dist.schmorp.de/libev/
 LIBEV_INSTALL_STAGING = YES
+LIBEV_LICENSE = BSD-2c or GPLv2+
+LIBEV_LICENSE_FILES = LICENSE
 
 $(eval $(autotools-package))
