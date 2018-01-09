From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jan 2018 09:46:47 +0100
Subject: [Buildroot] [git commit] daq: remove default <pkg>_SOURCE variable
Message-ID: <20180109084809.088E083C6A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20dd7b8fa824469ee2af24d91e173424e2032bfc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

<pkg>-<pkg-version>.tar.gz is the default value, so there's no need to
explicitly specify it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/daq/daq.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/daq/daq.mk b/package/daq/daq.mk
index 33c8a1f..a1edc20 100644
--- a/package/daq/daq.mk
+++ b/package/daq/daq.mk
@@ -6,7 +6,6 @@
 
 DAQ_VERSION = 2.0.6
 DAQ_SITE = https://www.snort.org/downloads/snort
-DAQ_SOURCE = daq-$(DAQ_VERSION).tar.gz
 DAQ_LICENSE = GPL-2.0
 DAQ_LICENSE_FILES = COPYING
 DAQ_INSTALL_STAGING = YES
