From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Jun 2015 15:59:28 +0200
Subject: [Buildroot] [git commit] dnsmasq: bump to version 2.73
Message-ID: <20150620135939.13EFF7F906@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=333002cffa66b85dcf3ba192234157caa8a4c137
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dnsmasq/dnsmasq.hash |    2 +-
 package/dnsmasq/dnsmasq.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.hash b/package/dnsmasq/dnsmasq.hash
index d5e5740..2d6e78c 100644
--- a/package/dnsmasq/dnsmasq.hash
+++ b/package/dnsmasq/dnsmasq.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	7d0bd23f5d74b3a6b26a75d5ffcf9db81d461b47cbe578cb65a83a98008600b1	dnsmasq-2.72.tar.xz
+sha256	0bff81103e53fcab3a3c4d0fd6df1882f9446dca4fa74ff8270e1d2ab872d8f6	dnsmasq-2.73.tar.xz
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 4b0999b..13352a9 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DNSMASQ_VERSION = 2.72
+DNSMASQ_VERSION = 2.73
 DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
