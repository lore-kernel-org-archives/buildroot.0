From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Jan 2021 22:01:47 +0100
Subject: [Buildroot] [git commit] package/iwd: add IWD_CPE_ID_VENDOR and
 IWD_CPE_ID_NAME
Message-ID: <20210121204358.0868F88F1F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=32f17574deba4c887b3ccc2de12a65f30b64e4ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:intel:inet_wireless_daemon is a valid CPE identifier for this package:

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=iwd

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/iwd/iwd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index b164970196..db98c02b58 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -9,6 +9,8 @@ IWD_SITE = https://git.kernel.org/pub/scm/network/wireless/iwd.git
 IWD_SITE_METHOD = git
 IWD_LICENSE = LGPL-2.1+
 IWD_LICENSE_FILES = COPYING
+IWD_CPE_ID_VENDOR = intel
+IWD_CPE_ID_NAME = inet_wireless_daemon
 # sources from git, no configure script provided
 IWD_AUTORECONF = YES
 IWD_SELINUX_MODULES = networkmanager
