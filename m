From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Jul 2013 14:49:41 +0200
Subject: [Buildroot] [git commit] bind: install to staging
Message-ID: <20130727130650.148F49AC91@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d8966bab7a49426d06029de9d12299bd32aff990
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Install bind to staging so other applications can use its include files
and libraries.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bind/bind.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 4137093..93fc9fb 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -7,6 +7,7 @@
 BIND_VERSION = 9.6-ESV-R9-P1
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_MAKE = $(MAKE1)
+BIND_INSTALL_STAGING = YES
 BIND_LICENSE = ISC
 BIND_LICENSE_FILES = COPYRIGHT
 BIND_TARGET_SBINS = lwresd named named-checkconf named-checkzone
