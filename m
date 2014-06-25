From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jun 2014 22:44:39 +0200
Subject: [Buildroot] [git commit] libhid: add license information
Message-ID: <20140625211213.D5EA89D0C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cbcb8febe2b5cae692d53ab8ec8e14a9baa61a39
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libhid/libhid.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libhid/libhid.mk b/package/libhid/libhid.mk
index 30501d5..469a607 100644
--- a/package/libhid/libhid.mk
+++ b/package/libhid/libhid.mk
@@ -9,6 +9,8 @@ LIBHID_SITE = http://sources.buildroot.net/
 LIBHID_DEPENDENCIES = libusb-compat libusb
 LIBHID_INSTALL_STAGING = YES
 LIBHID_AUTORECONF = YES
+LIBHID_LICENSE = GPLv2
+LIBHID_LICENSE_FILES = COPYING
 # configure runs libusb-config for cflags/ldflags. Ensure it picks up
 # the target version
 LIBHID_CONF_ENV = PATH=$(STAGING_DIR)/usr/bin:$(BR_PATH)
