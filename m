From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 10 Dec 2012 15:07:42 +0100
Subject: [Buildroot] [git commit] at91bootstrap: upstream moved to another
	URL
Message-ID: <20121210142117.6AC76996E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=422700feba3c56a5bb9534d222395c00c930df65
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/at91bootstrap/at91bootstrap.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
index d8caed7..46862c0 100644
--- a/boot/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 AT91BOOTSTRAP_VERSION = 1.16
-AT91BOOTSTRAP_SITE = http://www.atmel.com/dyn/resources/prod_documents/
+AT91BOOTSTRAP_SITE = http://www.atmel.com/Images
 AT91BOOTSTRAP_SOURCE = AT91Bootstrap$(AT91BOOTSTRAP_VERSION).zip
 
 AT91BOOTSTRAP_BOARD = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_BOARD))
