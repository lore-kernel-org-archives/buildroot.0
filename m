From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2016 23:01:16 +0200
Subject: [Buildroot] [git commit] wireshark: use https for download and
	homepage link
Message-ID: <20161019210216.8E154817FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=32e25af8c1e8a30301a9178a25185c319cfa24b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Saves a redirect.

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wireshark/Config.in    | 2 +-
 package/wireshark/wireshark.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
index defeb4b..4982c1f 100644
--- a/package/wireshark/Config.in
+++ b/package/wireshark/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_WIRESHARK
 	help
 	  Network traffic sniffer and protocol decoder.
 
-	  http://www.wireshark.org
+	  https://www.wireshark.org
 
 comment "wireshark needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 9cd92c4..ce83d52 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -6,7 +6,7 @@
 
 WIRESHARK_VERSION = 2.2.1
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
-WIRESHARK_SITE = http://www.wireshark.org/download/src/all-versions
+WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
 WIRESHARK_LICENSE_FILES = COPYING
 WIRESHARK_DEPENDENCIES = host-pkgconf libpcap libglib2
