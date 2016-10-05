From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Oct 2016 22:54:04 +0200
Subject: [Buildroot] [git commit] wireshark: security bump to version 2.2.1
Message-ID: <20161005205436.9A9AC8223A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ca6a5ed570efbb2dc5027877413eadbd638b4be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
wnpa-sec-2016-56 - The Bluetooth L2CAP dissector could crash.
wnpa-sec-2016-57 - The NCP dissector could crash.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wireshark/wireshark.hash | 4 ++--
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 73e57cd..21c003f 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,2 +1,2 @@
-# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.2.0.txt
-sha256 a6847e741efcba6cb9d92d464d4219917bee3ad0b8f5b0f80d4388ad2f3f1104  wireshark-2.2.0.tar.bz2
+# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.2.1.txt
+sha256 900e22af04c8b35e0d02a25a360ab1fb7cfe5ac18fc48a9afd75a7103e569149  wireshark-2.2.1.tar.bz2
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index aa0c6d0..8dc72da 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 2.2.0
+WIRESHARK_VERSION = 2.2.1
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = http://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
