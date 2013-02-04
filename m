From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Feb 2013 23:21:21 +0100
Subject: [Buildroot] [git commit] iw: switch upstream site
Message-ID: <20130204222118.57D1C9A930@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=614e400b5b6f64327fc7b46ae23ba569069a002b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's moved from wireless.kernel.org to generic kernel.org

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/iw/iw.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 22ea25c..9233833 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -6,7 +6,7 @@
 
 IW_VERSION = 3.8
 IW_SOURCE = iw-$(IW_VERSION).tar.bz2
-IW_SITE = http://wireless.kernel.org/download/iw
+IW_SITE = http://www.kernel.org/pub/software/network/iw
 IW_LICENSE = iw license
 IW_LICENSE_FILES = COPYING
 IW_DEPENDENCIES = host-pkgconf libnl
