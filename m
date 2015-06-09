From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jun 2015 21:38:28 +0200
Subject: [Buildroot] [git commit] mc: remove extra white space
Message-ID: <20150609193833.1C06681858@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=51c01a4292756a7007f2b3f310e3206b2f9c992e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mc/mc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mc/mc.mk b/package/mc/mc.mk
index 742b8e8..2803c90 100644
--- a/package/mc/mc.mk
+++ b/package/mc/mc.mk
@@ -7,7 +7,7 @@
 MC_VERSION = 4.8.14
 MC_SOURCE = mc-$(MC_VERSION).tar.xz
 MC_SITE = http://ftp.midnight-commander.org
-MC_LICENSE =  GPLv3+
+MC_LICENSE = GPLv3+
 MC_LICENSE_FILES = COPYING
 MC_DEPENDENCIES = libglib2 host-pkgconf
 
