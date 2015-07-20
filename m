From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Jul 2015 22:49:51 +0200
Subject: [Buildroot] [git commit] package/neard: remove autoreconf
Message-ID: <20150720205435.3589A81E4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a91e289630e6f1cee8b8b722151a7f6d8a50bb2d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

neard have been bumped several time since autoreconf
was added in neard.mk.
autoreconf seems not needed anymore.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/neard/neard.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/neard/neard.mk b/package/neard/neard.mk
index fc92421..ed2c6b1 100644
--- a/package/neard/neard.mk
+++ b/package/neard/neard.mk
@@ -10,7 +10,6 @@ NEARD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/nfc
 NEARD_LICENSE = GPLv2
 NEARD_LICENSE_FILES = COPYING
 
-NEARD_AUTORECONF = YES
 NEARD_DEPENDENCIES = host-pkgconf dbus libglib2 libnl
 NEARD_CONF_OPTS = --disable-traces
 
