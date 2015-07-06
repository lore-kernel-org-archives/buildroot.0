From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jul 2015 17:46:23 +0200
Subject: [Buildroot] [git commit] nano: bump to version 2.4.2
Message-ID: <20150706154818.D613A7FA3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e9b7ccb8de87c8edc16e2756d86e5d8ce4ecef30
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nano/nano.hash |    2 +-
 package/nano/nano.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index cb5d5b8..8ad1497 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	6a0ceb5e1b9b9bea72d5d1f46488ace4782b1f198ea6ba558480a86d994f29d2	nano-2.4.1.tar.gz
+sha256  c8cd7f18fcf5696d9df3364ee2a840e0ab7b6bdbd22abf850bbdc951db7f65b9  nano-2.4.2.tar.gz
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 4d47fdb..b030818 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NANO_VERSION = 2.4.1
+NANO_VERSION = 2.4.2
 NANO_SITE = $(BR2_GNU_MIRROR)/nano
 NANO_LICENSE = GPLv3+
 NANO_LICENSE_FILES = COPYING
