From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Dec 2013 10:14:18 +0100
Subject: [Buildroot] [git commit] wireshark: bump to version 1.10.3
Message-ID: <20131204093549.994039BF0B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6df5a40eccf88f0edbb54be24cb6a903ff047506
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current stable release of Wireshark is 1.10.3. It supersedes all
previous releases.  So let's upgrade to 1.10.3.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 9f968fd..ecd414f 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 1.8.11
+WIRESHARK_VERSION = 1.10.3
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = http://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
