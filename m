From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Apr 2021 23:00:55 +0200
Subject: [Buildroot] [git commit] boot/at91bootstrap: add legal information
Message-ID: <20210420203608.D801C80FFC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3887e8c095106762173b13127deb9c7da68c0625
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The old at91bootstrap version (1.x) uses a strange variant of the BSD
license, called "BSD Source Code Attribution" and referenced by SPDX
as BSD-Source-Code.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/at91bootstrap/at91bootstrap.hash | 1 +
 boot/at91bootstrap/at91bootstrap.mk   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/boot/at91bootstrap/at91bootstrap.hash b/boot/at91bootstrap/at91bootstrap.hash
index b1f963b825..d9f8db8897 100644
--- a/boot/at91bootstrap/at91bootstrap.hash
+++ b/boot/at91bootstrap/at91bootstrap.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  d66192a274247f4baa39fa932eadf903d7add55641d89d30402f967c4f2282a5  AT91Bootstrap1.16.zip
+sha256  6a3ac5dfcf19e6bac1b1109d30d72818768a3855e2594b84fe2b012b5fe0e77b  include/sdramc.h
diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
index c68b56b6ec..1a084756fd 100644
--- a/boot/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -7,6 +7,8 @@
 AT91BOOTSTRAP_VERSION = 1.16
 AT91BOOTSTRAP_SITE = ftp://www.at91.com/pub/at91bootstrap
 AT91BOOTSTRAP_SOURCE = AT91Bootstrap$(AT91BOOTSTRAP_VERSION).zip
+AT91BOOTSTRAP_LICENSE = BSD-Source-Code
+AT91BOOTSTRAP_LICENSE_FILES = include/sdramc.h
 
 AT91BOOTSTRAP_BOARD = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_BOARD))
 AT91BOOTSTRAP_MEMORY = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_MEMORY))
