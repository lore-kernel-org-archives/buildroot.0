From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Feb 2021 23:14:36 +0100
Subject: [Buildroot] [git commit] package/ccid: bump version to 1.4.34
Message-ID: <20210207215411.1E6727F8A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=75db1845cd6a4ff240f116f5a62086553957004b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
http://lists.infradead.org/pipermail/pcsclite-muscle/2021-January/001170.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ccid/ccid.hash | 2 +-
 package/ccid/ccid.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ccid/ccid.hash b/package/ccid/ccid.hash
index f129d2ae90..4ef7aff3d4 100644
--- a/package/ccid/ccid.hash
+++ b/package/ccid/ccid.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5256da939711deb42b74d05d2bd6bd0c73c4d564feb0c1a50212609eb680e424  ccid-1.4.33.tar.bz2
+sha256  e6f7645b59a9a2844eb4b1a7eff512960d7f04a4654af02f7fd2f8aded5db40a  ccid-1.4.34.tar.bz2
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
index 570c3907e8..3cb599d566 100644
--- a/package/ccid/ccid.mk
+++ b/package/ccid/ccid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCID_VERSION = 1.4.33
+CCID_VERSION = 1.4.34
 CCID_SOURCE = ccid-$(CCID_VERSION).tar.bz2
 CCID_SITE = https://ccid.apdu.fr/files
 CCID_LICENSE = LGPL-2.1+
