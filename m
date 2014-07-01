From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 17:24:01 +0200
Subject: [Buildroot] [git commit] dfu-util: add license information
Message-ID: <20140701153344.19A389D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a69f22d6008b4863ad9f9600efef29288daa048
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dfu-util/dfu-util.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/dfu-util/dfu-util.mk b/package/dfu-util/dfu-util.mk
index c58c347..e960a92 100644
--- a/package/dfu-util/dfu-util.mk
+++ b/package/dfu-util/dfu-util.mk
@@ -6,6 +6,8 @@
 
 DFU_UTIL_VERSION = 0.6
 DFU_UTIL_SITE = http://dfu-util.gnumonks.org/releases/
+DFU_UTIL_LICENSE = GPLv2+
+DFU_UTIL_LICENSE_FILES = COPYING
 
 HOST_DFU_UTIL_DEPENDENCIES = host-libusb
 
