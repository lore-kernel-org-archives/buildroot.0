From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Jun 2015 22:09:02 +0200
Subject: [Buildroot] [git commit] openvmtools: add OPENVMTOOLS_VERSION_MAJOR
	variable
Message-ID: <20150611200926.8EEC37FE24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=58a34b3c7fc8aacba937da6f0f306365343b128e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openvmtools/openvmtools.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index ef6544a..92ecd36 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-OPENVMTOOLS_VERSION = 9.10.0-2476743
+OPENVMTOOLS_VERSION_MAJOR = 9.10.0
+OPENVMTOOLS_VERSION = $(OPENVMTOOLS_VERSION_MAJOR)-2476743
 OPENVMTOOLS_SOURCE = open-vm-tools-$(OPENVMTOOLS_VERSION).tar.gz
-OPENVMTOOLS_SITE = http://downloads.sourceforge.net/project/open-vm-tools/open-vm-tools/stable-9.10.0
+OPENVMTOOLS_SITE = http://downloads.sourceforge.net/project/open-vm-tools/open-vm-tools/stable-$(OPENVMTOOLS_VERSION_MAJOR)
 OPENVMTOOLS_LICENSE = LGPLv2.1
 OPENVMTOOLS_LICENSE_FILES = COPYING
 # Autoreconf needed or config/missing will run configure again at buildtime
