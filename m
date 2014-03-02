From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Mar 2014 16:14:21 +0100
Subject: [Buildroot] [git commit] systemd: add missing host-gperf dependency
Message-ID: <20140302151449.164F69936F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f07c6c483c7d8f4718c82e91ff1c9d41a43f02e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/910/91010b43e63b82e050046b8f10c2c42f31a8a620/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/systemd.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 36ef704..92bdbcc 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -15,7 +15,8 @@ SYSTEMD_DEPENDENCIES = \
 	libcap \
 	dbus \
 	util-linux \
-	kmod
+	kmod \
+	host-gperf
 
 # Make sure that systemd will always be built after busybox so that we have
 # a consistent init setup between two builds
