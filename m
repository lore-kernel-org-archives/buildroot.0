From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 8 Feb 2012 22:31:39 +0100
Subject: [Buildroot] [git commit] iptables: no need to autoreconf
Message-ID: <20120208230356.BE51790A38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=779c9699f912131420291c6958db43a9d890e678
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/iptables/iptables.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 36fb64f..95134e3 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -8,7 +8,6 @@ IPTABLES_VERSION = 1.4.12.2
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = http://ftp.netfilter.org/pub/iptables
 IPTABLES_INSTALL_STAGING = YES
-IPTABLES_AUTORECONF = YES
 IPTABLES_DEPENDENCIES = host-pkg-config
 
 IPTABLES_CONF_OPT = --libexecdir=/usr/lib --with-kernel=$(LINUX_HEADERS_DIR)
