From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Oct 2015 06:13:35 +0100
Subject: [Buildroot] [git commit] syslog-ng: Update URL for upstream patches
Message-ID: <20151026051404.51B387F9E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ca3d59142d4029132ab14098a81ded84009b21e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rather than pointing at a developer's github repository point at the
official Balabit one. The commit SHAs are the same so no other change is
needed.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/syslog-ng/syslog-ng.mk |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 3441751..99b2a06 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -15,11 +15,11 @@ SYSLOG_NG_DEPENDENCIES = host-bison host-flex host-pkgconf \
 SYSLOG_NG_CONF_ENV = LIBS=-lrt
 SYSLOG_NG_CONF_OPTS = --disable-manpages
 SYSLOG_NG_PATCH = \
-	https://github.com/dnsjts/syslog-ng/commit/7b2b673ae2640ce9ad396f538fc25acb6e4405ec.patch \
-	https://github.com/dnsjts/syslog-ng/commit/f10941e565d402e032948bb9711bfbab43eadd88.patch \
-	https://github.com/dnsjts/syslog-ng/commit/96a633ce3f46ed102f38115000730bad41c4ed65.patch \
-	https://github.com/dnsjts/syslog-ng/commit/00526014247bb63680e53c35d4a76d0dac989405.patch \
-	https://github.com/dnsjts/syslog-ng/commit/46b07ecaffc154aa7cc713409196020736fe4f33.patch
+	https://github.com/balabit/syslog-ng/commit/7b2b673ae2640ce9ad396f538fc25acb6e4405ec.patch \
+	https://github.com/balabit/syslog-ng/commit/f10941e565d402e032948bb9711bfbab43eadd88.patch \
+	https://github.com/balabit/syslog-ng/commit/96a633ce3f46ed102f38115000730bad41c4ed65.patch \
+	https://github.com/balabit/syslog-ng/commit/00526014247bb63680e53c35d4a76d0dac989405.patch \
+	https://github.com/balabit/syslog-ng/commit/46b07ecaffc154aa7cc713409196020736fe4f33.patch
 
 # We override busybox's S01logging init script
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
