From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Feb 2020 22:15:59 +0100
Subject: [Buildroot] [git commit] package/janus-gateway: bump version to
 0.8.1
Message-ID: <20200216212052.F14068E334@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=350dc80dcbaee4fd544902eb0e9e1f5fbd6088d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Other changes:
  - Update License hash which properly adds the OpenSSL exception.

Tested with Debian 8:

br-arm-full [1/6]: OK
br-arm-cortex-a9-glibc [2/6]:   OK
 br-arm-cortex-m4-full [3/6]:   SKIPPED
        br-x86-64-musl [4/6]:   OK
    br-arm-full-static [5/6]:   SKIPPED
          sourcery-arm [6/6]:   OK

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/janus-gateway/janus-gateway.hash | 4 ++--
 package/janus-gateway/janus-gateway.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/janus-gateway/janus-gateway.hash b/package/janus-gateway/janus-gateway.hash
index 784c43d252..b74ec2511f 100644
--- a/package/janus-gateway/janus-gateway.hash
+++ b/package/janus-gateway/janus-gateway.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 d34868c259f388105fe16a5cd304a5684d45b1eddbe436293f4aa2178c0e4b6e janus-gateway-0.7.3.tar.gz
-sha256 0a884af515b4593503f6f0c9b424db3945bd77eaa2644d25f45eb93a412b3c19 COPYING
+sha256 668758f06e2a158f83b89d17aad322959221fbeadcc5611c6f7a38ff76fd2896 janus-gateway-0.8.1.tar.gz
+sha256 91d04c97fa1da3fcd28205873276358aafc071c5b00a9ea8c49dd06d487a9dc6 COPYING
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 0d0a22491f..d17a80f788 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-JANUS_GATEWAY_VERSION = 0.7.3
+JANUS_GATEWAY_VERSION = 0.8.1
 JANUS_GATEWAY_SITE = $(call github,meetecho,janus-gateway,v$(JANUS_GATEWAY_VERSION))
-JANUS_GATEWAY_LICENSE = GPL-3.0
+JANUS_GATEWAY_LICENSE = GPL-3.0 with OpenSSL exception
 JANUS_GATEWAY_LICENSE_FILES = COPYING
 
 # ding-libs provides the ini_config library
