From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Oct 2017 23:35:21 +0200
Subject: [Buildroot] [git commit] linuxptp: bump to the latest version
Message-ID: <20171010212918.C508A807AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f5dea383e71383a6f6114800c60b6e0f96f29ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update Linuxptp to the latest version from 1. September 2017
This update brings bugfixes and minor enhancements.

Signed-off-by: Petr Kulhavy <brain@jikos.cz>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linuxptp/linuxptp.hash | 2 +-
 package/linuxptp/linuxptp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linuxptp/linuxptp.hash b/package/linuxptp/linuxptp.hash
index ccda2d6..91144df 100644
--- a/package/linuxptp/linuxptp.hash
+++ b/package/linuxptp/linuxptp.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	b8190ab71a99f1dc32847f33cb301d2464d3f9e5f4c51300d55589aff42e8b3f  linuxptp-97c351cafd7327fd28047580c9e2528a6f7e742b.tar.gz
+sha256	40844a69df82853113732f15498f9bce2666d5052293a3d5d40a1983e7b7b6a6  linuxptp-17c9787b1d6891636b5be9e4e5a08278b44e9a7a.tar.gz
diff --git a/package/linuxptp/linuxptp.mk b/package/linuxptp/linuxptp.mk
index bf2176c..38d8e09 100644
--- a/package/linuxptp/linuxptp.mk
+++ b/package/linuxptp/linuxptp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUXPTP_VERSION = 97c351cafd7327fd28047580c9e2528a6f7e742b
+LINUXPTP_VERSION = 17c9787b1d6891636b5be9e4e5a08278b44e9a7a
 LINUXPTP_SITE_METHOD = git
 LINUXPTP_SITE = git://git.code.sf.net/p/linuxptp/code
 LINUXPTP_LICENSE = GPL-2.0+
