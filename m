From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Aug 2016 19:08:03 +0200
Subject: [Buildroot] [git commit branch/next] openipmi: bump to version
	2.0.22
Message-ID: <20160824170809.E2E898225C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a9cc30847badb96bc56645e8abdb14f6f2ec7304
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openipmi/openipmi.hash | 3 ++-
 package/openipmi/openipmi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/openipmi/openipmi.hash b/package/openipmi/openipmi.hash
index e6fafe4..30e3763 100644
--- a/package/openipmi/openipmi.hash
+++ b/package/openipmi/openipmi.hash
@@ -1,4 +1,5 @@
 # From http://sourceforge.net/projects/openipmi/files/OpenIPMI%202.0%20Library/
-sha1 54f63ab7fe09f6a4b0b718601fe9c61014aa220b OpenIPMI-2.0.21.tar.gz
+sha1 826081e7ed0ad430de9b8fdb75a9eaa10c99b660 OpenIPMI-2.0.22.tar.gz
 # Locally computed
+sha256	4988900043c35fcfa9b2bf275d6593904f6429221befb770ba6ecb5502108e55	OpenIPMI-2.0.22.tar.gz
 sha256	0eafaa502ccf752899c5089159574081067d0c4ac53ea0ace33a5087f33ea32a	0001-ui-use-standard-uint32_t.patch
diff --git a/package/openipmi/openipmi.mk b/package/openipmi/openipmi.mk
index ea46e19..9faa7c6 100644
--- a/package/openipmi/openipmi.mk
+++ b/package/openipmi/openipmi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-OPENIPMI_VERSION = 2.0.21
+OPENIPMI_VERSION = 2.0.22
 OPENIPMI_SITE = http://sourceforge.net/projects/openipmi/files/OpenIPMI%202.0%20Library
-OPENIPMI_SOURCE = OpenIPMI-2.0.21.tar.gz
+OPENIPMI_SOURCE = OpenIPMI-$(OPENIPMI_VERSION).tar.gz
 OPENIPMI_PATCH = \
 	http://sourceforge.net/p/openipmi/patches/26/attachment/0001-ui-use-standard-uint32_t.patch
 OPENIPMI_LICENSE = LGPLv2+, GPLv2+, BSD-3c
