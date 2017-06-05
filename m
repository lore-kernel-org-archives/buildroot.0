From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 15:55:33 +0200
Subject: [Buildroot] [git commit] package/igmpproxy: bump version
Message-ID: <20170605135541.5703D82894@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ed727bc41d58a96fa245cb0c0e9a54fe35a0e3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Last bump dates back to April 2016, time for current git HEAD.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/igmpproxy/igmpproxy.hash | 2 +-
 package/igmpproxy/igmpproxy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/igmpproxy/igmpproxy.hash b/package/igmpproxy/igmpproxy.hash
index 98dc242..2e3a374 100644
--- a/package/igmpproxy/igmpproxy.hash
+++ b/package/igmpproxy/igmpproxy.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  2be2171cf273678810283937f7752dc9b8402456d0a03ee55f06ca52fadf075f  igmpproxy-a731683d1a65956fa05024b0597b105fe6a3a122.tar.gz
+sha256 e60331031f85d1fb834c5272a134f32d32e7834718da19ba3f787dff68389a31  igmpproxy-f47644d8fa7266a784f3ec7b251e7d318bc2f0a9.tar.gz
diff --git a/package/igmpproxy/igmpproxy.mk b/package/igmpproxy/igmpproxy.mk
index 545a17e..8989c74 100644
--- a/package/igmpproxy/igmpproxy.mk
+++ b/package/igmpproxy/igmpproxy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IGMPPROXY_VERSION = a731683d1a65956fa05024b0597b105fe6a3a122
+IGMPPROXY_VERSION = f47644d8fa7266a784f3ec7b251e7d318bc2f0a9
 IGMPPROXY_SITE = $(call github,pali,igmpproxy,$(IGMPPROXY_VERSION))
 IGMPPROXY_AUTORECONF = YES
 IGMPPROXY_LICENSE = GPL-2.0+
