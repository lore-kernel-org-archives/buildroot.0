From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Nov 2015 21:53:42 +0100
Subject: [Buildroot] [git commit branch/next] nano: bump to version 2.4.3
Message-ID: <20151118205349.7BC427FD8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d8566397dbc267320b2f989e32b90159787c6394
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nano/nano.hash |    2 +-
 package/nano/nano.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index 8ad1497..c924151 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256  c8cd7f18fcf5696d9df3364ee2a840e0ab7b6bdbd22abf850bbdc951db7f65b9  nano-2.4.2.tar.gz
+sha256  32d627072b6026678e4f4095c047adec92ac7ec542dd6d91cf27f49b601768f2  nano-2.4.3.tar.gz
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 9b84490..28161f3 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NANO_VERSION = 2.4.2
+NANO_VERSION = 2.4.3
 NANO_SITE = $(BR2_GNU_MIRROR)/nano
 NANO_LICENSE = GPLv3+
 NANO_LICENSE_FILES = COPYING
