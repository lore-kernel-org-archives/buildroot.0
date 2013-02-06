From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 6 Feb 2013 14:42:49 +0100
Subject: [Buildroot] [git commit] iw: use BR2_KERNEL_MIRROR for SITE
Message-ID: <20130206134909.420289A9CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4b8a6ae84cbafa6c276af6120dca34f541a96acb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As pointed by Arnout Vandecappelle.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/iw/iw.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 9233833..54c42d7 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -6,7 +6,7 @@
 
 IW_VERSION = 3.8
 IW_SOURCE = iw-$(IW_VERSION).tar.bz2
-IW_SITE = http://www.kernel.org/pub/software/network/iw
+IW_SITE = $(BR2_KERNEL_MIRROR)/software/network/iw
 IW_LICENSE = iw license
 IW_LICENSE_FILES = COPYING
 IW_DEPENDENCIES = host-pkgconf libnl
