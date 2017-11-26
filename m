From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 22:40:59 +0100
Subject: [Buildroot] [git commit branch/2017.08.x] package/samba4: bump
 version to 4.6.10
Message-ID: <20171126213857.415E6802C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd4890d82175bab157d41bde438fdc5812f5270b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

Quoting release notes
https://www.samba.org/samba/history/samba-4.6.10.html

"This is an additional bugfix release to address a possible data
 corruption issue. Please update immediately! For details, please see

  https://bugzilla.samba.org/show_bug.cgi?id=13130

 Samba 4.6.0 and newer is affected by this issue."

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 806e6becb76649ecfc1104d0c284bb3f6a9245dd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 2 +-
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 7446b1b..6821144 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 c31db4aad82f0b9588ef6c4b4dab5dce3fa1787bd298e62d953c2628bb1af21a  samba-4.6.9.tar.gz
+sha256 5913a569b54c6bc261bc245d7326fabfcba42839d15a82db48c047de1eb19626  samba-4.6.10.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 7502fa6..40436ca 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.6.9
+SAMBA4_VERSION = 4.6.10
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
