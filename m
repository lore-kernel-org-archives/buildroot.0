From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 23:21:35 +0100
Subject: [Buildroot] [git commit] quagga: remove redundant assignment
Message-ID: <20150304222214.5135B81804@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=34d032e0d0ceebc0e8f0e8e6d6abe5e81f2f1f24
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This redundant assignement was mistakenly added in commit
a839ac38e158344afb9e5494ce154b93b88bb162.

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/quagga/quagga.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 16fcb64..4a12ab3 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -7,7 +7,6 @@
 QUAGGA_VERSION = 0.99.24
 QUAGGA_SOURCE = quagga-$(QUAGGA_VERSION).tar.xz
 QUAGGA_SITE = http://download.savannah.gnu.org/releases/quagga
-QUAGGA_SOURCE = quagga-$(QUAGGA_VERSION).tar.xz
 QUAGGA_DEPENDENCIES = host-gawk
 QUAGGA_LICENSE = GPLv2+
 QUAGGA_LICENSE_FILES = COPYING
