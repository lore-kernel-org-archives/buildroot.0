From: Iulian Onofrei <iulian.onofrei@yahoo.com>
Date: Sun, 30 Aug 2020 15:36:08 +0300
Subject: [Buildroot] [PATCH] Fix typos
References: <20200830123610.20164-1-iulian.onofrei.ref@yahoo.com>
Message-ID: <20200830123610.20164-1-iulian.onofrei@yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Iulian Onofrei <6d0847b9@opayq.com>

---
 package/libeXosip2/Config.in           | 4 ++--
 package/nvidia-driver/nvidia-driver.mk | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libeXosip2/Config.in b/package/libeXosip2/Config.in
index 4cb8218f20..9fbe9789f8 100644
--- a/package/libeXosip2/Config.in
+++ b/package/libeXosip2/Config.in
@@ -4,10 +4,10 @@ config BR2_PACKAGE_LIBEXOSIP2
 	select BR2_PACKAGE_LIBOSIP2
 	help
 	  eXosip is a library that hides the complexity of using the
-	  SIP protocol for mutlimedia session establishement.
+	  SIP protocol for multimedia session establishment.
 	  This protocol is mainly to be used by VoIP telephony
 	  applications (endpoints or conference server) but might be
-	  also usefull for any application that wish to establish
+	  also useful for any application that wish to establish
 	  sessions like multiplayer games.
 	  eXosip is based in libosip.
 
diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index baf2ba2be5..44e34cb7b4 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -35,7 +35,7 @@ NVIDIA_DRIVER_PROVIDES += libgl libegl libgles
 # NVidia extensions (which is deemed bad now), while the former follows
 # the newly-introduced vendor-neutral "dispatching" API/ABI:
 #   https://github.com/aritger/linux-opengl-abi-proposal/blob/master/linux-opengl-abi-proposal.txt
-# However, this is not very usefull to us, as we don't support multiple
+# However, this is not very useful to us, as we don't support multiple
 # GL providers at the same time on the system, which this proposal is
 # aimed at supporting.
 #
@@ -84,7 +84,7 @@ endef
 # Those libraries are 'private' libraries requiring an agreement with
 # NVidia to develop code for those libs. There seems to be no restriction
 # on using those libraries (e.g. if the user has such an agreement, or
-# wants to run a third-party program developped under such an agreement).
+# wants to run a third-party program developed under such an agreement).
 ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_PRIVATE_LIBS),y)
 NVIDIA_DRIVER_LIBS += \
 	libnvidia-ifr.so.$(NVIDIA_DRIVER_VERSION) \
-- 
2.24.3 (Apple Git-128)
