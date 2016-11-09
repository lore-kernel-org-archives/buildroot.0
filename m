From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 22:37:23 +0100
Subject: [Buildroot] [git commit branch/next] swupdate: bump to version
	2016.10
Message-ID: <20161109213927.7409581D68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f4c905adf76d49c33ba29f090a149a6128b64cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

A short list of new features:

- progress interface as general way to signalize the update
  status outside of the process.

- support encrypted artifacts (encryption via simmetric keys)

- host verification for swu images (-c option)

- configuration file to configure the update process

- HAwkbit backend: API extended, support for configData messages

- Hawkbit backend: supports SSL certificates

- remote handler : general interface to connect external
  installers.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/swupdate/swupdate.hash | 2 +-
 package/swupdate/swupdate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index 918ca2f..1ba10f6 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  c21d2fd52eb7ed9c304a7a996d230a8f1b47b9879a8c9fa50c80b41e117d1e60  swupdate-2016.07.tar.gz
+sha256  840d6287a41f7a42e08a74045ee40b7c2f82c1ecfedf8c915e3935d4f0084376  swupdate-2016.10.tar.gz
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index d442810..c905c1d 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2016.07
+SWUPDATE_VERSION = 2016.10
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPLv2+, MIT, Public Domain
 SWUPDATE_LICENSE_FILES = COPYING
