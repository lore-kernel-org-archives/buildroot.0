From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Nov 2020 08:29:37 +0100
Subject: [Buildroot] [git commit branch/next] package/libiqrf: add license
 file
Message-ID: <20201117203826.D67BD7FD00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=062e5d8a65f31f44723a51ad2086b47bd6d04949
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add license file and, while at it, update indentation to two spaces

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libiqrf/libiqrf.hash | 3 ++-
 package/libiqrf/libiqrf.mk   | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libiqrf/libiqrf.hash b/package/libiqrf/libiqrf.hash
index b7f3b9bf2c..df749def17 100644
--- a/package/libiqrf/libiqrf.hash
+++ b/package/libiqrf/libiqrf.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 8111031dd9dd6093a1927eb32dd7476fe22cfee9190043aa8e4c88003c104b16  libiqrf-0.1.2.tar.gz
+sha256  8111031dd9dd6093a1927eb32dd7476fe22cfee9190043aa8e4c88003c104b16  libiqrf-0.1.2.tar.gz
+sha256  11e0700d7c23604d86fa1e7c54c7caa778d79eeb0035be8f80b5a552224ef015  src/iqrf.c
diff --git a/package/libiqrf/libiqrf.mk b/package/libiqrf/libiqrf.mk
index cd03373dec..3f4e3e8498 100644
--- a/package/libiqrf/libiqrf.mk
+++ b/package/libiqrf/libiqrf.mk
@@ -9,5 +9,6 @@ LIBIQRF_SITE = $(call github,nandra,libiqrf,v$(LIBIQRF_VERSION))
 LIBIQRF_INSTALL_STAGING = YES
 LIBIQRF_DEPENDENCIES = libusb
 LIBIQRF_LICENSE = LGPL-2.1+
+LIBIQRF_LICENSE_FILES = src/iqrf.c
 
 $(eval $(cmake-package))
