From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 May 2014 11:44:41 +0200
Subject: [Buildroot] [git commit] attr: clarify license info
Message-ID: <20140526094735.2796D9CDD4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d30a13652ad63e866f12d54c22f796fe1ace275c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As pointed out by Thomas Petazzoni in his review.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/attr/attr.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/attr/attr.mk b/package/attr/attr.mk
index 87bdd21..97f8939 100644
--- a/package/attr/attr.mk
+++ b/package/attr/attr.mk
@@ -9,7 +9,7 @@ ATTR_SOURCE = attr-$(ATTR_VERSION).src.tar.gz
 ATTR_SITE = http://download.savannah.gnu.org/releases/attr
 ATTR_INSTALL_STAGING = YES
 ATTR_CONF_OPT = --enable-gettext=no
-ATTR_LICENSE = GPLv2+ LGPGv2.1+
+ATTR_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)
 ATTR_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
 
 # While the configuration system uses autoconf, the Makefiles are
