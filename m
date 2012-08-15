From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Aug 2012 12:03:05 +0200
Subject: [Buildroot] [git commit] ifplugd: add license info
Message-ID: <20120815100417.D3CBF971A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dc2a7bc8193f26368d2f2357fd8d57d952f0931b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ifplugd/ifplugd.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/ifplugd/ifplugd.mk b/package/ifplugd/ifplugd.mk
index 3c581a6..1e11c14 100644
--- a/package/ifplugd/ifplugd.mk
+++ b/package/ifplugd/ifplugd.mk
@@ -6,7 +6,10 @@
 
 IFPLUGD_VERSION = 0.28
 IFPLUGD_SITE = http://0pointer.de/lennart/projects/ifplugd
+IFPLUGD_LICENSE = GPLv2
+IFPLUGD_LICENSE_FILES = LICENSE
 IFPLUGD_AUTORECONF = YES
+
 # install-strip unconditionally overwrites $(TARGET_DIR)/etc/ifplugd/ifplugd.*
 IFPLUGD_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-exec
 IFPLUGD_CONF_OPT = --disable-lynx
