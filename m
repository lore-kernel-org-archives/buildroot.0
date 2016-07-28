From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jul 2016 22:00:41 +0200
Subject: [Buildroot] [git commit] wireshark: bump version to 2.0.5
Message-ID: <20160728201546.865527FDA3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=becf3831d7d918baba10630e01a4de07f0e1d7a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.hash | 4 ++--
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index abe961b..fe4070b 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,2 +1,2 @@
-# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.0.4.txt
-sha256	9ea9c82da9942194ebc8fc5c951a02e6d179afa7472cb6d96ca76154510de1a5	wireshark-2.0.4.tar.bz2
+# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.0.5.txt
+sha256 0ce0241330828973f5b4efee422a3760cab8ce0b41e7721c4b9fd185be1bb10b  wireshark-2.0.5.tar.bz2
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 55f931b..35f0138 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 2.0.4
+WIRESHARK_VERSION = 2.0.5
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = http://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
