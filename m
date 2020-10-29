From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Oct 2020 23:38:17 +0100
Subject: [Buildroot] [git commit] package/pax-utils: bump to version 1.2.6
Message-ID: <20201029222624.D24B682A4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef4f72aef7bf87ed0c31fbabedca3904053c39d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pax-utils/pax-utils.hash | 2 +-
 package/pax-utils/pax-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pax-utils/pax-utils.hash b/package/pax-utils/pax-utils.hash
index 1b4cee4fb8..0ef8fad643 100644
--- a/package/pax-utils/pax-utils.hash
+++ b/package/pax-utils/pax-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7f4a7f8db6b4743adde7582fa48992ad01776796fcde030683732f56221337d9  pax-utils-1.2.2.tar.xz
+sha256  9742d2a31d53a4e0f6df0d3721ab6f7cf8b0404c95fee3b00e678c1ff6db7f21  pax-utils-1.2.6.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/pax-utils/pax-utils.mk b/package/pax-utils/pax-utils.mk
index b31468eca2..502fc87446 100644
--- a/package/pax-utils/pax-utils.mk
+++ b/package/pax-utils/pax-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PAX_UTILS_VERSION = 1.2.2
+PAX_UTILS_VERSION = 1.2.6
 PAX_UTILS_SITE = http://distfiles.gentoo.org/distfiles
 PAX_UTILS_SOURCE = pax-utils-$(PAX_UTILS_VERSION).tar.xz
 PAX_UTILS_LICENSE = GPL-2.0
