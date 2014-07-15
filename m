From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 22:13:03 +0200
Subject: [Buildroot] [git commit] at: add license information
Message-ID: <20140715201907.CCB289D244@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=58b748dc480f79f49a341ba81defc7fe7425adc9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/at/at.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/at/at.mk b/package/at/at.mk
index 0fe5b9a..f4d899c 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -11,6 +11,8 @@ AT_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/a/at
 AT_MAKE = $(MAKE1)
 AT_AUTORECONF = YES
 AT_DEPENDENCIES = $(if $(BR2_PACKAGE_FLEX),flex) host-bison host-flex
+AT_LICENSE = GPLv2+, GPLv3+, ISC
+AT_LICENSE_FILES = Copyright COPYING
 
 AT_CONF_OPT = \
         --with-jobdir=/var/spool/cron/atjobs \
