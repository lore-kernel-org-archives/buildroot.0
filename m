From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Mar 2014 22:22:29 +0100
Subject: [Buildroot] [git commit] python-posix-ipc and
	mobile-broadband-provider-info: fix package .mk name
Message-ID: <20140315212245.DE4BA9BF82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3861a0a0cc7b0758cfb4ac155ad03b71b8649e1b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix typo in python-posix-ipc package name and rename
mobile_broadband_provider_info according to naming policy

Signed-off-by: Arnaud Aujon <arnaud@intelibre.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...r_info.mk => mobile-broadband-provider-info.mk} |    2 +-
 .../{python-poxix-ipc.mk => python-posix-ipc.mk}   |    0
 2 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk
similarity index 95%
rename from package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk
rename to package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk
index 431e172..f2a1136 100644
--- a/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk
+++ b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# mobile_broadband_provider_info
+# mobile-broadband-provider-info
 #
 ################################################################################
 
diff --git a/package/python-posix-ipc/python-poxix-ipc.mk b/package/python-posix-ipc/python-posix-ipc.mk
similarity index 100%
rename from package/python-posix-ipc/python-poxix-ipc.mk
rename to package/python-posix-ipc/python-posix-ipc.mk
