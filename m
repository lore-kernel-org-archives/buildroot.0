From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Aug 2012 12:02:44 +0200
Subject: [Buildroot] [git commit] avahi: add license info
Message-ID: <20120815100417.A0017971A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6ba785ca6cb49750ebef3c3673395da39e435167
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/avahi/avahi.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index d9c0d1d..a26481d 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -13,6 +13,8 @@
 AVAHI_VERSION = 0.6.31
 AVAHI_SOURCE = avahi-$(AVAHI_VERSION).tar.gz
 AVAHI_SITE = http://www.avahi.org/download/
+AVAHI_LICENSE = LGPLv2.1+
+AVAHI_LICENSE_FILES = LICENSE
 AVAHI_INSTALL_STAGING = YES
 
 AVAHI_CONF_ENV = ac_cv_func_strtod=yes \
