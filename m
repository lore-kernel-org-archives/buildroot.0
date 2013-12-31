From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Dec 2013 12:02:31 +0100
Subject: [Buildroot] [git commit] transmission: version bump to 2.8.2
Message-ID: <20131231110238.A71419C2E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=771772bb97ce1c780a0e5b6acb0426e2a1b9ccf3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/transmission/transmission.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index 1e7ee48..3ced558 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRANSMISSION_VERSION = 2.33
+TRANSMISSION_VERSION = 2.82
 TRANSMISSION_SITE = http://download.transmissionbt.com/files/
 TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.xz
 TRANSMISSION_DEPENDENCIES = \
