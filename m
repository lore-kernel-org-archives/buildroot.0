From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 6 Feb 2013 22:43:52 +0100
Subject: [Buildroot] [git commit] ser2net: add license information
Message-ID: <20130206214834.613199A9D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1975bbf11ea108411380af81c6823c0feedb7d02
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ser2net/ser2net.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index d2c3270..e4ad340 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -7,5 +7,7 @@
 SER2NET_VERSION = 2.7
 SER2NET_SOURCE = ser2net-$(SER2NET_VERSION).tar.gz
 SER2NET_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net/$(SER2NET_VERSION)
+SER2NET_LICENSE = GPLv2+
+SER2NET_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
