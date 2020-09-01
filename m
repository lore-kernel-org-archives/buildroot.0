From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Sep 2020 21:35:36 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/nvidia-driver:
 fix typos in comments
Message-ID: <20200901193231.5B1EC85EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a260fe91510c362bc1efe54da6b29f38b69fa578
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Signed-off-by: Iulian Onofrei <iulian.onofrei@yahoo.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 21fca042d942e5460fd384b9f6a1eef13a191160)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nvidia-driver/nvidia-driver.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
