From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Aug 2016 13:07:51 +0200
Subject: [Buildroot] [git commit] tcpdump: bump version to 4.8.0
Message-ID: <20160802110954.D569C819A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae0411654e05f87939e20dbb2ffbe83ae03b4fee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tcpdump/tcpdump.hash | 2 +-
 package/tcpdump/tcpdump.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tcpdump/tcpdump.hash b/package/tcpdump/tcpdump.hash
index 5943347..997cd42 100644
--- a/package/tcpdump/tcpdump.hash
+++ b/package/tcpdump/tcpdump.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	6be520269a89036f99c0b2126713a60965953eab921002b07608ccfc0c47d9af	tcpdump-4.7.4.tar.gz
+sha256 177385d9d17d1d99ba6aa3ea63a8400a5f4c54db62b83ac6d4da56944bee623b  tcpdump-4.8.0.tar.gz
diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index 14b3503..559b816 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPDUMP_VERSION = 4.7.4
+TCPDUMP_VERSION = 4.8.0
 TCPDUMP_SITE = http://www.tcpdump.org/release
 TCPDUMP_LICENSE = BSD-3c
 TCPDUMP_LICENSE_FILES = LICENSE
