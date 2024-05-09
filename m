Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799D8C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3413F61399;
	Thu,  9 May 2024 20:47:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mw8nMxD-7HZA; Thu,  9 May 2024 20:47:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A555161388
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A555161388;
	Thu,  9 May 2024 20:47:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E72C51BF98E
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01CFB83FEF
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:46:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TWdbQslk0LEn for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:46:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15FF983FFA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15FF983FFA
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:46:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F05886C8F; Thu,  9 May 2024 20:46:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 22:45:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b847f88fef768c8e79422db4193533b3a7488ea
X-Git-Newrev: de5ed8021269e18070b92def5df10f9157bc2085
X-Patchwork-Hint: ignore
Message-Id: <20240509204629.0F05886C8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {boot,
 package}: update hashes for generated archives
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=de5ed8021269e18070b92def5df10f9157bc2085
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 boot/edk2/edk2.hash                                                     | 2 +-
 boot/vexpress-firmware/vexpress-firmware.hash                           | 2 +-
 package/abootimg/abootimg.hash                                          | 2 +-
 package/aer-inject/aer-inject.hash                                      | 2 +-
 package/am33x-cm3/am33x-cm3.hash                                        | 2 +-
 package/armbian-firmware/armbian-firmware.hash                          | 2 +-
 package/azure-iot-sdk-c/azure-iot-sdk-c.hash                            | 2 +-
 package/balena-engine/balena-engine.hash                                | 2 +-
 package/bayer2rgb-neon/bayer2rgb-neon.hash                              | 2 +-
 package/bpftool/bpftool.hash                                            | 2 +-
 package/brickd/brickd.hash                                              | 2 +-
 package/c-capnproto/c-capnproto.hash                                    | 2 +-
 package/cni-plugins/cni-plugins.hash                                    | 2 +-
 package/containerd/containerd.hash                                      | 2 +-
 package/crucible/crucible.hash                                          | 2 +-
 package/dbus-triggerd/dbus-triggerd.hash                                | 2 +-
 package/delve/delve.hash                                                | 2 +-
 package/depot-tools/depot-tools.hash                                    | 2 +-
 package/docker-cli/docker-cli.hash                                      | 2 +-
 package/docker-compose/docker-compose.hash                              | 2 +-
 package/docker-engine/docker-engine.hash                                | 2 +-
 package/dtv-scan-tables/dtv-scan-tables.hash                            | 2 +-
 package/edid-decode/edid-decode.hash                                    | 2 +-
 package/embiggen-disk/embiggen-disk.hash                                | 2 +-
 package/firmware-utils/firmware-utils.hash                              | 2 +-
 package/flannel/flannel.hash                                            | 2 +-
 package/flashbench/flashbench.hash                                      | 2 +-
 package/flutter-pi/flutter-pi.hash                                      | 2 +-
 package/freescale-imx/imx-lib/imx-lib.hash                              | 2 +-
 package/gitlab-runner/gitlab-runner.hash                                | 2 +-
 package/gocryptfs/gocryptfs.hash                                        | 2 +-
 package/google-breakpad/google-breakpad.hash                            | 2 +-
 package/gstreamer1/gst1-interpipe/gst1-interpipe.hash                   | 2 +-
 .../gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.hash        | 2 +-
 package/gstreamer1/gst1-shark/gst1-shark.hash                           | 2 +-
 package/ibm-sw-tpm2/ibm-sw-tpm2.hash                                    | 2 +-
 package/ivi-homescreen/ivi-homescreen.hash                              | 2 +-
 package/kvmtool/kvmtool.hash                                            | 2 +-
 package/libbroadvoice/libbroadvoice.hash                                | 2 +-
 package/libcamera/libcamera.hash                                        | 2 +-
 package/libdbi-drivers/libdbi-drivers.hash                              | 2 +-
 package/libdbi/libdbi.hash                                              | 2 +-
 package/libg7221/libg7221.hash                                          | 2 +-
 package/libilbc/libilbc.hash                                            | 2 +-
 package/libsilk/libsilk.hash                                            | 2 +-
 package/libsvgtiny/libsvgtiny.hash                                      | 2 +-
 package/libubox/libubox.hash                                            | 2 +-
 package/libuci/libuci.hash                                              | 2 +-
 package/libxmlrpc/libxmlrpc.hash                                        | 2 +-
 package/libyuv/libyuv.hash                                              | 2 +-
 package/linux-syscall-support/linux-syscall-support.hash                | 2 +-
 package/mender-artifact/mender-artifact.hash                            | 2 +-
 package/mender-connect/mender-connect.hash                              | 2 +-
 package/mender/mender.hash                                              | 2 +-
 package/mmc-utils/mmc-utils.hash                                        | 2 +-
 package/moby-buildkit/moby-buildkit.hash                                | 2 +-
 package/mxsldr/mxsldr.hash                                              | 2 +-
 package/nerdctl/nerdctl.hash                                            | 2 +-
 package/netsurf-buildsystem/netsurf-buildsystem.hash                    | 2 +-
 package/odhcp6c/odhcp6c.hash                                            | 2 +-
 package/ogre/ogre.hash                                                  | 2 +-
 package/open62541/open62541.hash                                        | 2 +-
 package/opkg-utils/opkg-utils.hash                                      | 2 +-
 package/pcm-tools/pcm-tools.hash                                        | 2 +-
 package/piglit/piglit.hash                                              | 2 +-
 package/prelink-cross/prelink-cross.hash                                | 2 +-
 package/psplash/psplash.hash                                            | 2 +-
 package/qt-webkit-kiosk/qt-webkit-kiosk.hash                            | 2 +-
 package/qt5/qt5coap/qt5coap.hash                                        | 2 +-
 package/qt5/qt5knx/qt5knx.hash                                          | 2 +-
 package/qt5/qt5location/qt5location.hash                                | 2 +-
 package/qt5/qt5mqtt/qt5mqtt.hash                                        | 2 +-
 package/qt5/qt5opcua/qt5opcua.hash                                      | 2 +-
 .../qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.hash  | 2 +-
 package/rockchip-rkbin/rockchip-rkbin.hash                              | 2 +-
 package/rtc-tools/rtc-tools.hash                                        | 2 +-
 package/rtmpdump/rtmpdump.hash                                          | 2 +-
 package/runc/runc.hash                                                  | 2 +-
 package/signal-estimator/signal-estimator.hash                          | 2 +-
 package/sox/sox.hash                                                    | 2 +-
 package/tftpd/tftpd.hash                                                | 2 +-
 package/ti-sgx-demos/ti-sgx-demos.hash                                  | 2 +-
 package/ti-sgx-km/ti-sgx-km.hash                                        | 2 +-
 package/ti-sgx-um/ti-sgx-um.hash                                        | 2 +-
 package/tinifier/tinifier.hash                                          | 2 +-
 package/tl-expected/tl-expected.hash                                    | 2 +-
 package/tremor/tremor.hash                                              | 2 +-
 package/ubus/ubus.hash                                                  | 2 +-
 package/uclibc-ng-test/uclibc-ng-test.hash                              | 2 +-
 package/uemacs/uemacs.hash                                              | 2 +-
 package/uhttpd/uhttpd.hash                                              | 2 +-
 package/uqmi/uqmi.hash                                                  | 2 +-
 package/ustream-ssl/ustream-ssl.hash                                    | 2 +-
 package/vboot-utils/vboot-utils.hash                                    | 2 +-
 package/wilink-bt-firmware/wilink-bt-firmware.hash                      | 2 +-
 package/wtfutil/wtfutil.hash                                            | 2 +-
 package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash    | 2 +-
 .../xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.hash    | 2 +-
 package/x264/x264.hash                                                  | 2 +-
 package/yavta/yavta.hash                                                | 2 +-
 100 files changed, 100 insertions(+), 100 deletions(-)

diff --git a/boot/edk2/edk2.hash b/boot/edk2/edk2.hash
index 44f8f1f255..f7daa8ddf3 100644
--- a/boot/edk2/edk2.hash
+++ b/boot/edk2/edk2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  009ee7eeb7d7911cae8367e86bc3605465713aceb478d8603acc314ae39f8782  edk2-edk2-stable202308-git3.tar.gz
+sha256  6bdfdffcc2235a117b3f9d4124da63103f19ff30157673f812e1093b20ebb7ad  edk2-edk2-stable202308-git4.tar.gz
 sha256  50ce20c9cfdb0e19ee34fe0a51fc0afe961f743697b068359ab2f862b494df80  License.txt
diff --git a/boot/vexpress-firmware/vexpress-firmware.hash b/boot/vexpress-firmware/vexpress-firmware.hash
index 1814b7fd93..26d1ccc6e5 100644
--- a/boot/vexpress-firmware/vexpress-firmware.hash
+++ b/boot/vexpress-firmware/vexpress-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  ea92d686e6e211074fb0f62cb5e011f4cfc294c7f6ec9fb27b7d987db7bf51c5  vexpress-firmware-901f81977c3b367a2e0bf3d6444be302822d97a3-git3.tar.gz
+sha256  ba3253d422a53e97cff99548956b911eb971c8b28cd767118d563a3c2cd1da39  vexpress-firmware-901f81977c3b367a2e0bf3d6444be302822d97a3-git4.tar.gz
diff --git a/package/abootimg/abootimg.hash b/package/abootimg/abootimg.hash
index ed4fd787fa..9a67a575ed 100644
--- a/package/abootimg/abootimg.hash
+++ b/package/abootimg/abootimg.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f377da42a57d982cfc22fa75c5a69febdc3e4c1ef43cd0ceaec42e14067e2f37  abootimg-1ebeb393252ab5aeed62e34bc439b6728444f06e-git3.tar.gz
+sha256  a87493a268b5043974a433545b073730ca88cbc58d3c7086da291ec0c082d8bc  abootimg-1ebeb393252ab5aeed62e34bc439b6728444f06e-git4.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/aer-inject/aer-inject.hash b/package/aer-inject/aer-inject.hash
index 610ae3e112..3b9d144ec9 100644
--- a/package/aer-inject/aer-inject.hash
+++ b/package/aer-inject/aer-inject.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2dd2bd73aa738c1cc26ba04b6e502329778d18c2cc873c0bd00e6b2d38e9477c  aer-inject-9bd5e2c7886fca72f139cd8402488a2235957d41-git3.tar.gz
+sha256  7ed5994b48f1c0504add380ba4d186f48a5a22b9bc2dd90c79d0d2f0c183540c  aer-inject-9bd5e2c7886fca72f139cd8402488a2235957d41-git4.tar.gz
 sha256  659a191d8775e05c6c6a9a4ba66b3577c577342bb83f20d393135eb6633c8973  README
diff --git a/package/am33x-cm3/am33x-cm3.hash b/package/am33x-cm3/am33x-cm3.hash
index 5bd5d2c35e..33dc205f3b 100644
--- a/package/am33x-cm3/am33x-cm3.hash
+++ b/package/am33x-cm3/am33x-cm3.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c0b11d7ed2300172354f2948e858ddb5cae19d084bd1ab6d48cfa7b6bfa13261  am33x-cm3-11107db2f1e9e58ee75d4fe9cc38423c9a6e4365-git3.tar.gz
+sha256  79b05eda90498390778001caf18435617d5983c075b5b4a6b339bee40551e946  am33x-cm3-11107db2f1e9e58ee75d4fe9cc38423c9a6e4365-git4.tar.gz
 sha256  e136e6949a1d3ca144374375af8b9387faa11d2eee7debff8cf22ca8fe7bf7e9  License.txt
diff --git a/package/armbian-firmware/armbian-firmware.hash b/package/armbian-firmware/armbian-firmware.hash
index fecff5caf3..24f35d91ff 100644
--- a/package/armbian-firmware/armbian-firmware.hash
+++ b/package/armbian-firmware/armbian-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  aae090f892e59124fe29fc35f4a81eeee3960e58db2be7dd2d991155b46d3c02  armbian-firmware-5d685ad233b4dfd03a4d025fa0061f6b0f850cb3-git3.tar.gz
+sha256  c3a2a6e801844402100e71e61960684e8cb93e085187451953300b9783832f43  armbian-firmware-5d685ad233b4dfd03a4d025fa0061f6b0f850cb3-git4.tar.gz
diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
index 0dd86dd681..fdc1acc624 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  b853d5ab04f3c6863fe78e3936f0d0840012d5260ae4a3b23f03e157395dc15b  azure-iot-sdk-c-LTS_08_2023-git3.tar.gz
+sha256  73bf42846089152d298d4a3810df274820aa84013943676eb71a7d4131a4a769  azure-iot-sdk-c-LTS_08_2023-git4.tar.gz
 
 # Hash for license files:
 sha256  be2e9913fad9ff33607287c728f392579e2a6cc83e51b203ef6274c41db02ee7  LICENSE
diff --git a/package/balena-engine/balena-engine.hash b/package/balena-engine/balena-engine.hash
index ce5e2ba7f4..076c72fd9a 100644
--- a/package/balena-engine/balena-engine.hash
+++ b/package/balena-engine/balena-engine.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1482b64e35d5406be719e362647ed7d0599cf4eead7770247ebd972c4c85ede5  balena-engine-20.10.26-go1.tar.gz
+sha256  1482b64e35d5406be719e362647ed7d0599cf4eead7770247ebd972c4c85ede5  balena-engine-20.10.26-go2.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/bayer2rgb-neon/bayer2rgb-neon.hash b/package/bayer2rgb-neon/bayer2rgb-neon.hash
index 9d2ff402a7..c376bc645d 100644
--- a/package/bayer2rgb-neon/bayer2rgb-neon.hash
+++ b/package/bayer2rgb-neon/bayer2rgb-neon.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  35b38a40e98e9fa7fb8042c718f460fb806e916d2bf3e9721c07bbe4b42faad5  bayer2rgb-neon-bc950b3398ba034fe5cc39f625796a6111cdb87f-git3.tar.gz
+sha256  c7673c16f7f9bf7bd7cb1f258a4ba0cfd705d475f4bd2fb978ffdb60adff57c4  bayer2rgb-neon-bc950b3398ba034fe5cc39f625796a6111cdb87f-git4.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/bpftool/bpftool.hash b/package/bpftool/bpftool.hash
index 19adffed7c..4f83e71a76 100644
--- a/package/bpftool/bpftool.hash
+++ b/package/bpftool/bpftool.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  35ff149cab4a3ab209b0c04cab2707243ab7ee753de5f4b5678296c975cf7fe0  bpftool-v7.1.0-git3.tar.gz
+sha256  89d3ce783d5c9e40b9060b380869911ee9d5ab6732a4b1dd19a90103c5e41e6c  bpftool-v7.1.0-git4.tar.gz
 sha256  7c588754d5e81e92e2a12e47cf78949d485c9c22b4850f12d21b3835c85947d1  LICENSE
 sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  LICENSE.BSD-2-Clause
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL-2.0
diff --git a/package/brickd/brickd.hash b/package/brickd/brickd.hash
index b603a451c4..2a4139d1d1 100644
--- a/package/brickd/brickd.hash
+++ b/package/brickd/brickd.hash
@@ -1,5 +1,5 @@
 # Locally computed hash
-sha256  8469b6959a7e32c4b39a56e1a4f7479f785d83e6db3269487f5312f3cf1df382  brickd-v1.2.2-git3.tar.gz
+sha256  6aef2678596046db8cc0b1797050c6f143a528c075fb26340966250f6c33b7ce  brickd-v1.2.2-git4.tar.gz
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.txt
diff --git a/package/c-capnproto/c-capnproto.hash b/package/c-capnproto/c-capnproto.hash
index 31dc331ccf..715f15c937 100644
--- a/package/c-capnproto/c-capnproto.hash
+++ b/package/c-capnproto/c-capnproto.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1e35ef786bd8e418ff04fccb20ac881a87fa2fa76df1cbddc4774e35423bafb8  c-capnproto-9053ebe6eeb2ae762655b982e27c341cb568366d-git3.tar.gz
+sha256  f5d52ff9c4ec522667090abc56ae99e7dd07532c2b9835d1b1b9fd23315c93cb  c-capnproto-9053ebe6eeb2ae762655b982e27c341cb568366d-git4.tar.gz
 sha256  27797e6c7dce96675d79ed250584d157b7a86405db6eb6fba9644e6d96d42c57  COPYING
diff --git a/package/cni-plugins/cni-plugins.hash b/package/cni-plugins/cni-plugins.hash
index deb0b6f258..5de05b8ba1 100644
--- a/package/cni-plugins/cni-plugins.hash
+++ b/package/cni-plugins/cni-plugins.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f9871b9f6ccb51d2b264532e96521e44f926928f91434b56ce135c95becf2901  cni-plugins-1.3.0-go1.tar.gz
+sha256  f9871b9f6ccb51d2b264532e96521e44f926928f91434b56ce135c95becf2901  cni-plugins-1.3.0-go2.tar.gz
 sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index 7edfd21ee7..1b2609e880 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  ae55b25fb04b45dfbbde8280b034783a48ae7c40350d17fd272be5cbf0284cf1  containerd-1.7.14-go1.tar.gz
+sha256  ae55b25fb04b45dfbbde8280b034783a48ae7c40350d17fd272be5cbf0284cf1  containerd-1.7.14-go2.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/crucible/crucible.hash b/package/crucible/crucible.hash
index 6edc0be744..959dc89286 100644
--- a/package/crucible/crucible.hash
+++ b/package/crucible/crucible.hash
@@ -1,2 +1,2 @@
-sha256  0bed6766e5d584805c117fa049a050ccb9079f41449c661e20845414ed930868  crucible-2023.11.02-go1.tar.gz
+sha256  466b7b0be8b5085d669d63cca2a80f04c6dcbdd887a51333532ecb804a6b74ca  crucible-2023.11.02-go2.tar.gz
 sha256  a89c50d83be30fe7ec75be69a07f6c1b5dfaae0a6b94a678d2394fff34acb69c  LICENSE
diff --git a/package/dbus-triggerd/dbus-triggerd.hash b/package/dbus-triggerd/dbus-triggerd.hash
index b1b5c28aa0..c5127133fb 100644
--- a/package/dbus-triggerd/dbus-triggerd.hash
+++ b/package/dbus-triggerd/dbus-triggerd.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  930cccfe8bdff98cab0cff003d90f9421858850d2d00143108191b62b4ef5e5a  dbus-triggerd-ba3dbec805cb707c94c54de21666bf18b79bcc09-git3.tar.gz
+sha256  73dbd92e89eee223928b5cbf414affb5913f70c1ca7e3f8ab733a4696436dae3  dbus-triggerd-ba3dbec805cb707c94c54de21666bf18b79bcc09-git4.tar.gz
 sha256  30d135650639af9019633690fc1aecbfc150aeeef9446347d4286a58338d10b0  dbus-triggerd.c
diff --git a/package/delve/delve.hash b/package/delve/delve.hash
index 86f3c8cc5c..d99133ab5f 100644
--- a/package/delve/delve.hash
+++ b/package/delve/delve.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fe6f0d97c233d4f0f1ed422c11508cc57c14e9e0915f9a258f1912c46824cbfb  delve-1.22.1-go1.tar.gz
+sha256  fe6f0d97c233d4f0f1ed422c11508cc57c14e9e0915f9a258f1912c46824cbfb  delve-1.22.1-go2.tar.gz
 sha256  778864b990007e8cef6633f8c372dd05bac1fada6cf67b008afb1483f83b38f5  LICENSE
diff --git a/package/depot-tools/depot-tools.hash b/package/depot-tools/depot-tools.hash
index 1cda4040bd..e2dfe2f923 100644
--- a/package/depot-tools/depot-tools.hash
+++ b/package/depot-tools/depot-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  aae1c07274691c29ed9962255a7621f8198d0f05a1a7e144ebee76d991a5b9bf  depot-tools-8d14454ba4a35fd9d2483842b08815a2357ec86f-git3.tar.gz
+sha256  75cc0f9c8bf711c1821b2b1ac873fe75c6fa256f5cdd6a5585a02214ed36d792  depot-tools-8d14454ba4a35fd9d2483842b08815a2357ec86f-git4.tar.gz
 sha256  984523ee987f4e8b72d61df37d8f1189a7077cd4b77e41a397e35593b297a29d  LICENSE
diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 2ccc880c0b..a2bed4aaed 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b047e180c94452b4375f7e43997286e5a5712e66b1280574974b2e117b4e43bd  docker-cli-26.0.2-go1.tar.gz
+sha256  b047e180c94452b4375f7e43997286e5a5712e66b1280574974b2e117b4e43bd  docker-cli-26.0.2-go2.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-compose/docker-compose.hash b/package/docker-compose/docker-compose.hash
index 7e7d974ef2..cda4a130d5 100644
--- a/package/docker-compose/docker-compose.hash
+++ b/package/docker-compose/docker-compose.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  105328838a48dad4a305903c5ae98b928e8a4ea3546e1711690e9eef7e0232be  docker-compose-2.26.1-go1.tar.gz
+sha256  821aac932d0a3bbe583ea290ae777cec785a77f987c5007a30970fa6568e9322  docker-compose-2.26.1-go2.tar.gz
 sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 7111c77c13..e13527944e 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f1cf6a2e69607daa0e2ae9b5be752dc269ab30dee16f5f2180f7ff7f29270606  docker-engine-26.0.2-go1.tar.gz
+sha256  f1cf6a2e69607daa0e2ae9b5be752dc269ab30dee16f5f2180f7ff7f29270606  docker-engine-26.0.2-go2.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/dtv-scan-tables/dtv-scan-tables.hash b/package/dtv-scan-tables/dtv-scan-tables.hash
index 9a4fd2adca..fd2edb13c8 100644
--- a/package/dtv-scan-tables/dtv-scan-tables.hash
+++ b/package/dtv-scan-tables/dtv-scan-tables.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  b77c6bcbbc20f6b6bdbf735fb75cf9bec8634e1e6d3a32e6db2573deeb7a2212  dtv-scan-tables-57ed2982275045ea5e92ef2a40b9fa58255852e5-git3.tar.gz
+sha256  6bf3e1839f3c4ab9c63994043c1a5dfd3e2b9a6f717fd1db3db0e7a53baf5518  dtv-scan-tables-57ed2982275045ea5e92ef2a40b9fa58255852e5-git4.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
 sha256  4fd46f32582c29007657e2daad8d0a6d954cf4e9d2e47bae8f8d8c32765fc987  COPYING.LGPL
diff --git a/package/edid-decode/edid-decode.hash b/package/edid-decode/edid-decode.hash
index 3e127b979e..9a2012f06b 100644
--- a/package/edid-decode/edid-decode.hash
+++ b/package/edid-decode/edid-decode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a8774f1d3eb031ffa4ecb85135b47ad28afeeaa7cf9e8410c5b51a29b83bbfdd  edid-decode-2d44e1b01c7ed7d65b20ecdce62d354841832201-git3.tar.gz
+sha256  45b71227ceb7265da3a314a8d0969dcca584bfa12c36690e911646b58aae0738  edid-decode-2d44e1b01c7ed7d65b20ecdce62d354841832201-git4.tar.gz
 sha256  9bc7ab961e9a07dc84eaa0210af388def56d024357e79671fb89fe27d073eed7  LICENSE
diff --git a/package/embiggen-disk/embiggen-disk.hash b/package/embiggen-disk/embiggen-disk.hash
index 8f54a5f80e..86e9346e9b 100644
--- a/package/embiggen-disk/embiggen-disk.hash
+++ b/package/embiggen-disk/embiggen-disk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  514cde66ab9fe6af91b97f17acc19b37976f675ebea0e1be741d6bd621811d87  embiggen-disk-9e7b2fc7b99c4dece41a805489a6ca377ce55a62-go1.tar.gz
+sha256  aa6019311ea869b1f7cbca640462eae6cfa0fef5a65ec5266ca394b261217960  embiggen-disk-9e7b2fc7b99c4dece41a805489a6ca377ce55a62-go2.tar.gz
 sha256  063aedec1652c5a05c2d04c40e032b932453142ee8ef7fd53c04a9acc127fc95  LICENSE
diff --git a/package/firmware-utils/firmware-utils.hash b/package/firmware-utils/firmware-utils.hash
index b264af8703..8e09c06733 100644
--- a/package/firmware-utils/firmware-utils.hash
+++ b/package/firmware-utils/firmware-utils.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  0df1b7912d68822025f9bb6a7ddfdf9675e2116d34c3c74bbdc83defcefe203c  firmware-utils-86739f2b3ae9502368b89ef37fa6f31c42aad6f4-git3.tar.gz
+sha256  5d6fdc6ba3cb3976df68625cbc59a1e0acbd5ecaf9daa41c3a2aaad1ff368f51  firmware-utils-86739f2b3ae9502368b89ef37fa6f31c42aad6f4-git4.tar.gz
diff --git a/package/flannel/flannel.hash b/package/flannel/flannel.hash
index 23fcfac4cf..831f6234da 100644
--- a/package/flannel/flannel.hash
+++ b/package/flannel/flannel.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  c0de130efa2b14bc0f057a17df07bfd61154b30ce4a5eca24594c5b533ce661d  flannel-0.25.1-go1.tar.gz
+sha256  8406a3b2b799344197c79f96e5b39ea7b6228f0bb2cb069b5f44dce684e29b9b  flannel-0.25.1-go2.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/flashbench/flashbench.hash b/package/flashbench/flashbench.hash
index ea76d47371..274d890f2d 100644
--- a/package/flashbench/flashbench.hash
+++ b/package/flashbench/flashbench.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  422860966ad3528a7fd1dc88e4aa0b2bd91f11fa6429523b9acd21dc5beb6a19  flashbench-2e30b1968a66147412f21002ea844122a0d5e2f0-git3.tar.gz
+sha256  b5f95d2d057270adbce0f1a784b6a88db339b67326b6ca92474edd99f9fd4774  flashbench-2e30b1968a66147412f21002ea844122a0d5e2f0-git4.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/flutter-pi/flutter-pi.hash b/package/flutter-pi/flutter-pi.hash
index 4212b68fc9..135a0deb32 100644
--- a/package/flutter-pi/flutter-pi.hash
+++ b/package/flutter-pi/flutter-pi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4ab2ae849d46261fe22ed94eae5726841d34119a5656e85b26c7c8802050d14c  flutter-pi-783db32ec6441b878783bfa241777d3bfe6b35e2-git3.tar.gz
+sha256  a7ce5c8d960735923f6897dd9852b89c8010a01b9a29f4f6bbbf7c016dac623c  flutter-pi-783db32ec6441b878783bfa241777d3bfe6b35e2-git4.tar.gz
 sha256  b34df9d3e1b4e5d1ba70b1740ec74b69f1189b44efd0c96b898b074ef8db1c70  LICENSE
diff --git a/package/freescale-imx/imx-lib/imx-lib.hash b/package/freescale-imx/imx-lib/imx-lib.hash
index 7b37a170b0..3443d1d664 100644
--- a/package/freescale-imx/imx-lib/imx-lib.hash
+++ b/package/freescale-imx/imx-lib/imx-lib.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  cad7823568cbd367ed8525e01c8c11a2393fc2dc481425273cb7919385367c61  imx-lib-3f777974c0c146817e2ff5cb0340ca66a1f99e57-git3.tar.gz
+sha256  09362a83d9e24525d9aeb6b6d557935f06054dc430fb66ec5676a99f0ca49608  imx-lib-3f777974c0c146817e2ff5cb0340ca66a1f99e57-git4.tar.gz
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING-LGPL-2.1
diff --git a/package/gitlab-runner/gitlab-runner.hash b/package/gitlab-runner/gitlab-runner.hash
index ff10497232..4514056365 100644
--- a/package/gitlab-runner/gitlab-runner.hash
+++ b/package/gitlab-runner/gitlab-runner.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  da3e62ae1a34cd7523dd54ad0317ed87f35906f4d3b1a9032c12d5b04a45b0b8  gitlab-runner-15.5.0-go1.tar.gz
+sha256  d09aba81c6bb4a55783a45c7bc5d686aa6084e25e27920d2a1004cc4a63f6db7  gitlab-runner-15.5.0-go2.tar.gz
 sha256  0ae968b7ddd25da0209c3c6594aac1ac74ddf90385940b02b420463e2e0734de  LICENSE
diff --git a/package/gocryptfs/gocryptfs.hash b/package/gocryptfs/gocryptfs.hash
index 1e8ea8974d..faeb0b3d4e 100644
--- a/package/gocryptfs/gocryptfs.hash
+++ b/package/gocryptfs/gocryptfs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  862c771dc25094afb5faef9a2c44accbe4b695a6be0f6cfa0a56963dd6c39351  gocryptfs-2.3.2-go1.tar.gz
+sha256  6cfb1dffd0ff396b355b83ab1ff55b774e2246982dad4683703f11e58bfb0e3f  gocryptfs-2.3.2-go2.tar.gz
 sha256  322a7e3b02cf18e38b7e6b18cafefb773df8676c65634b34e8a2beb931294a4b  LICENSE
diff --git a/package/google-breakpad/google-breakpad.hash b/package/google-breakpad/google-breakpad.hash
index ed104d1761..cff0fddf9d 100644
--- a/package/google-breakpad/google-breakpad.hash
+++ b/package/google-breakpad/google-breakpad.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  29e147011bf6577df95ee3a50bf5ffd1941645dd414d569bd409a9035bcbb7f7  google-breakpad-f49c2f1a2023da0cb055874fba050563dfea57db-git3.tar.gz
+sha256  23d74651790fd8168a9f5d910988a93abee7d4c5297ec477dca545b037a237c0  google-breakpad-f49c2f1a2023da0cb055874fba050563dfea57db-git4.tar.gz
 sha256  69b3d80c19a460e09716910d54d1ada5d800716e2b73751bebac44352590f646  LICENSE
diff --git a/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash b/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
index fa247aa361..7004466e60 100644
--- a/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
+++ b/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
@@ -1,5 +1,5 @@
 # locally computed hash
-sha256  b97af0dfa108c5f736a961c388267c7a9c8f915e753985d7e85939091032deed  gst1-interpipe-v1.1.8-git3.tar.gz
+sha256  c8614f53c65aea9086cfa64803ceb0617e5ef699413a1effbb68aaea23ca0c1c  gst1-interpipe-v1.1.8-git4.tar.gz
 
 # Hashes for license files:
 sha256  16d7caa6cabbfd0ca47e064a7b48cb446d013e84ca88c854d6470851752136d5  COPYING
diff --git a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.hash b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.hash
index 3676e116ad..1efaf6421d 100644
--- a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.hash
+++ b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  76b2135a23f465f789ccb86bd3a8190a1e30f86cdb28abfac4d9a2cdece63fa2  gst1-plugins-bayer2rgb-neon-b630798efcd611879e7cb1c246052e5ba1acc41d-git3.tar.gz
+sha256  6ae89adf1979edf5760bbf2fb589dcaa905cff55bb828e6b271bc3d1e403a130  gst1-plugins-bayer2rgb-neon-b630798efcd611879e7cb1c246052e5ba1acc41d-git4.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gstreamer1/gst1-shark/gst1-shark.hash b/package/gstreamer1/gst1-shark/gst1-shark.hash
index ff1057a6cd..509d3444ad 100644
--- a/package/gstreamer1/gst1-shark/gst1-shark.hash
+++ b/package/gstreamer1/gst1-shark/gst1-shark.hash
@@ -1,4 +1,4 @@
-sha256  07587922dc49d12abe2444590a88c530409854b02904ad50357b312f9b6ea736  gst1-shark-v0.8.1-git3.tar.gz
+sha256  28817276848dcff7dcbf5ecd78a0b69f34d3dfcd08a07f5244d9405729f76b94  gst1-shark-v0.8.1-git4.tar.gz
 
 # Hashes for license files:
 sha256  6d191b8f1fa03cabced18b8e48fddbf960a19f965bed8491e76ed62238f92f0b  COPYING
diff --git a/package/ibm-sw-tpm2/ibm-sw-tpm2.hash b/package/ibm-sw-tpm2/ibm-sw-tpm2.hash
index 65d6163855..392fb59815 100644
--- a/package/ibm-sw-tpm2/ibm-sw-tpm2.hash
+++ b/package/ibm-sw-tpm2/ibm-sw-tpm2.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d11203a73946ad14ca39f4b74742c0d81762dbe7e913a4685f92620f1d6fe295  ibm-sw-tpm2-5452af422edeff70fcae8ea99dd28a0922051d7b-git3.tar.gz
+sha256  da7799baa1d38cd9d2f491006de45d38805db9d5a77c38af6e78728bd318f93e  ibm-sw-tpm2-5452af422edeff70fcae8ea99dd28a0922051d7b-git4.tar.gz
 sha256  dd2d31b560011ea673e197251e710e52669d911367d83cd3cfd018f8ed58bde9  LICENSE
diff --git a/package/ivi-homescreen/ivi-homescreen.hash b/package/ivi-homescreen/ivi-homescreen.hash
index ff302c7fef..60b9281abc 100644
--- a/package/ivi-homescreen/ivi-homescreen.hash
+++ b/package/ivi-homescreen/ivi-homescreen.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  1ab2e7ab5f947482cb5529dbb6392e7e1945ceb0b593abde6b6279d7bd2fdb79  ivi-homescreen-5ab78a19e95c88cc5d6b173ab1260a211e78cf0a-git3.tar.gz
+sha256  733a95a9b50875e8b45b0b69118656edba3ba88ecc65e3c0d76ea5df9761c433  ivi-homescreen-5ab78a19e95c88cc5d6b173ab1260a211e78cf0a-git4.tar.gz
 
 # Apache-2.0
 sha256  6b96fa0a3def85caaf466caa2bd82d4ca4f22d106ff88f97a00c537c00cc714b  LICENSE
diff --git a/package/kvmtool/kvmtool.hash b/package/kvmtool/kvmtool.hash
index bedb76e313..f7436dd3c9 100644
--- a/package/kvmtool/kvmtool.hash
+++ b/package/kvmtool/kvmtool.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e2eb2cd8b31d24484e3095923cfe8c36d4b92741b76965cafaed6be3835369c6  kvmtool-f77d646ba01d04be5aad9449ac00719c043fe36e-git3.tar.gz
+sha256  dbc3537e63ebff35bc19bdf6c90d74dad24f9175d8130baba79831ba2ad1788d  kvmtool-f77d646ba01d04be5aad9449ac00719c043fe36e-git4.tar.gz
 sha256  0d5bf346df9e635a29dcdddf832dc5b002ca6cdc1c5c9c6c567d2a61bb0c5c15  COPYING
diff --git a/package/libbroadvoice/libbroadvoice.hash b/package/libbroadvoice/libbroadvoice.hash
index 5cb80df59c..1644fb4ba1 100644
--- a/package/libbroadvoice/libbroadvoice.hash
+++ b/package/libbroadvoice/libbroadvoice.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  777e5dccc3d189514b7f8e85b6c941d3b9d16d2d68d72cad055cbdfb571d3681  libbroadvoice-f65b0f50c8c767229fbf1758370880abc0d78564-git3.tar.gz
+sha256  74b7c9bbf90d2d8d8ec9befe73066f5c0d734498f586f6c870eb24dff2edcad7  libbroadvoice-f65b0f50c8c767229fbf1758370880abc0d78564-git4.tar.gz
 sha256  2550586c993ce4a8c23c8b11968ea36192116a896a2504799cc65307d769c094  COPYING
diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index b27c8ad473..1ae74b3b18 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,4 +1,4 @@
-sha256  5909ed3248946083179d36e1f3e3dc692e5a973bbac31828d3d91d94579e76ac  libcamera-v0.2.0-git3.tar.gz
+sha256  f9c3e949f9d6a42e29322833e57a0e6e8c54655507c820636470ea597e767fd8  libcamera-v0.2.0-git4.tar.gz
 
 # license files
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libdbi-drivers/libdbi-drivers.hash b/package/libdbi-drivers/libdbi-drivers.hash
index ab5444de6b..3408e1d681 100644
--- a/package/libdbi-drivers/libdbi-drivers.hash
+++ b/package/libdbi-drivers/libdbi-drivers.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  80a1befb044238a89b2d0dbd40881aa6c75bf99d3a7a6c016c657ea26df7792c  libdbi-drivers-0bfae6c43134cf58dc89364328545982ca297abb-git3.tar.gz
+sha256  a1e9c65153141a8adf91e97e782a2d55b9641dec5a6440ffa82e3d7cee724ce2  libdbi-drivers-0bfae6c43134cf58dc89364328545982ca297abb-git4.tar.gz
 sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
diff --git a/package/libdbi/libdbi.hash b/package/libdbi/libdbi.hash
index d6c678da77..4ab3cd68e4 100644
--- a/package/libdbi/libdbi.hash
+++ b/package/libdbi/libdbi.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  958475e0010a3d8e43ce9ecd6a64d25eacca6ada46c39bc69f949dd70f92ab7a  libdbi-88b8477d57153b9f736dd19d432d3b7ab1c49073-git3.tar.gz
+sha256  8ceef7c6d40ad8cdc843bbdc0068619883ab8b833f5b43038ec36cf46350e332  libdbi-88b8477d57153b9f736dd19d432d3b7ab1c49073-git4.tar.gz
 sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
diff --git a/package/libg7221/libg7221.hash b/package/libg7221/libg7221.hash
index dee5fb5a78..c7a7755b4d 100644
--- a/package/libg7221/libg7221.hash
+++ b/package/libg7221/libg7221.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7f00d6a4f435a91ab3bc96e6c95aa1334bd416f80d98843b4f178067239ee832  libg7221-dbfc29d4806ecdace50379a2f4d68a992a6fec34-git3.tar.gz
+sha256  65942f84219f6586abc448e387f8c904777de64b3695449ac23132e4e9bde1d5  libg7221-dbfc29d4806ecdace50379a2f4d68a992a6fec34-git4.tar.gz
 sha256  26cc5f718279b45dbe34e25a2d29b2c8ca487bd9ab11b2d68c9318ff59d5c645  COPYING
diff --git a/package/libilbc/libilbc.hash b/package/libilbc/libilbc.hash
index 9ee3a00300..bd0bf89d42 100644
--- a/package/libilbc/libilbc.hash
+++ b/package/libilbc/libilbc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f97d8284776c95b31ed5d5441f13b519b8c7966b77a26aa06c29bb77e02cfe16  libilbc-829b08c7902ceb87a261279fabb36b6d523c6e07-git3.tar.gz
+sha256  ba11bc22e353887cd7c605a25a5b9bac464f11f8cb103f652e095ae7e0f04f77  libilbc-829b08c7902ceb87a261279fabb36b6d523c6e07-git4.tar.gz
 sha256  b7f4cbb4a12cd11a3d1aeda9bd17c99f59b054de4b3ee53045531cd2fa74dd2a  gips_iLBClicense.pdf
diff --git a/package/libsilk/libsilk.hash b/package/libsilk/libsilk.hash
index 4936e6c679..3ed7eac46c 100644
--- a/package/libsilk/libsilk.hash
+++ b/package/libsilk/libsilk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ac79eb4c154af25c0ab25e12d60d3b4165c399903fe88d82e066cf6d9827503e  libsilk-4268a02240c35c6055b0f237c46b09b2dcf79e45-git3.tar.gz
+sha256  1b2d44790e841f0707b06fa10af798fa97a326ad4a6a3395b12be1231ed6f9a3  libsilk-4268a02240c35c6055b0f237c46b09b2dcf79e45-git4.tar.gz
 sha256  62a5963f034024665641f4a9888b208f1e39aa7e29e87c9634fdcf07d3073baf  COPYING
diff --git a/package/libsvgtiny/libsvgtiny.hash b/package/libsvgtiny/libsvgtiny.hash
index 9c7f31d730..55f4093e19 100644
--- a/package/libsvgtiny/libsvgtiny.hash
+++ b/package/libsvgtiny/libsvgtiny.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  917850350d014c953f2af0fb92f0eeb25652619710922d467c98f8109fb92baf  libsvgtiny-ea9d99fc8b231c22d06168135e181d61f4eb2f06-git3.tar.gz
+sha256  758641d339b324a76294ef08e323faa2cefb557793f437c08af7deb3b73a453e  libsvgtiny-ea9d99fc8b231c22d06168135e181d61f4eb2f06-git4.tar.gz
 sha256  92b965c77be71661cae51425a6b40a5ca274f44cc13c723c90fb471a9a26a828  README
diff --git a/package/libubox/libubox.hash b/package/libubox/libubox.hash
index 3c2f8f948a..7738caf223 100644
--- a/package/libubox/libubox.hash
+++ b/package/libubox/libubox.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b06311e7d857583303e9256f58787857944572012fbfd4a5d83e92e0e684f654  libubox-75a3b870cace1171faf57bd55e5a9a2f1564f757-git3.tar.gz
+sha256  918acc85199117ef109f2a204020f6fe4d5a1724a09888f45b70b6474345d6fe  libubox-75a3b870cace1171faf57bd55e5a9a2f1564f757-git4.tar.gz
diff --git a/package/libuci/libuci.hash b/package/libuci/libuci.hash
index b5a23960ca..cc04320331 100644
--- a/package/libuci/libuci.hash
+++ b/package/libuci/libuci.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  4b4e3ef9c9f51c02a1985c63ff0e8fc1f3aafdf24491247a4dc33c993c3fa1ea  libuci-4b3db1179747b6a6779029407984bacef851325c-git3.tar.gz
+sha256  d095dc7ff4714e33aa18ef3ea5d30f525a202d6997d7b13bd952da53818988d6  libuci-4b3db1179747b6a6779029407984bacef851325c-git4.tar.gz
 sha256  39e1cc18a36172fb80d9b37f0af77d78ae935bd8a020978a7895d9e76a24e112  cli.c
 sha256  69d4eea4de19d27014f3d6ed723081b4039700bfd73cd0a5e39e2c4f19a58c66  libuci.c
diff --git a/package/libxmlrpc/libxmlrpc.hash b/package/libxmlrpc/libxmlrpc.hash
index 7ce9da2db2..b9167ca5a0 100644
--- a/package/libxmlrpc/libxmlrpc.hash
+++ b/package/libxmlrpc/libxmlrpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f22f96a6dc1a574a843b5e383446fe1fa1022f211ee7c3f4c5fd8de1d5104393  libxmlrpc-r3176-svn4.tar.gz
+sha256  7265be1a181e57106707b5278daf64b2a717b8a2a9e6ec8992d8c8084e64eaa2  libxmlrpc-r3176-svn5.tar.gz
 sha256  db7a6d3f187b218c3534010a83424c6bcdef88e6a0b6b1aa3a8762238bd642e6  doc/COPYING
diff --git a/package/libyuv/libyuv.hash b/package/libyuv/libyuv.hash
index 542a1e33aa..095da4e606 100644
--- a/package/libyuv/libyuv.hash
+++ b/package/libyuv/libyuv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7bb4118ef050ca3e9a27f49b7d21e068922bf57cf973f2c7b1476cadf73ac66a  libyuv-413a8d8041f1cc5a350a47c0d81cc721e64f9fd0-git3.tar.gz
+sha256  e27c9d73ca502361d0e532065e790e41a958ae0369f1edfa4d296d33317653b1  libyuv-413a8d8041f1cc5a350a47c0d81cc721e64f9fd0-git4.tar.gz
 sha256  2b2cc1180c7e6988328ad2033b04b80117419db9c4c584918bbb3cfec7e9364f  LICENSE
diff --git a/package/linux-syscall-support/linux-syscall-support.hash b/package/linux-syscall-support/linux-syscall-support.hash
index 3b157fc8a3..398bc75a22 100644
--- a/package/linux-syscall-support/linux-syscall-support.hash
+++ b/package/linux-syscall-support/linux-syscall-support.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2a12703ce59773ec714b603e46c733b03f3fbf9b4763195fae40d0042e5da3f6  linux-syscall-support-e1e7b0ad8ee99a875b272c8e33e308472e897660-git3.tar.gz
+sha256  32691765be505df5ca26bc3d0cc0a90da286b804e1ecb945b6bea5ead652b04b  linux-syscall-support-e1e7b0ad8ee99a875b272c8e33e308472e897660-git4.tar.gz
 sha256  c180f12840c00224cceed7139192018d2c7e6061db4ce4310b8626f7ad10bf26  LICENSE
diff --git a/package/mender-artifact/mender-artifact.hash b/package/mender-artifact/mender-artifact.hash
index 91caa5c6f1..9d77f068e2 100644
--- a/package/mender-artifact/mender-artifact.hash
+++ b/package/mender-artifact/mender-artifact.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  d3ed68d8637195ff35de97b12c8fa148cebffb1ee0fd0d43909ec1643c0c296a  mender-artifact-3.8.0-go1.tar.gz
+sha256  d3ed68d8637195ff35de97b12c8fa148cebffb1ee0fd0d43909ec1643c0c296a  mender-artifact-3.8.0-go2.tar.gz
 sha256  b8462a14975e30fb0dff14ed50e7563e833ccce13c2aa93f95386ffe877ed673  LIC_FILES_CHKSUM.sha256
 
 # License hash extracted from LIC_FILES_CHKSUM.sha256 using the
diff --git a/package/mender-connect/mender-connect.hash b/package/mender-connect/mender-connect.hash
index 4f8abeb76c..33ad999180 100644
--- a/package/mender-connect/mender-connect.hash
+++ b/package/mender-connect/mender-connect.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  96b81bb4c72eb8c1756febb94101c0dea5a6d4884591824e61a5f2509cd9ca9b  mender-connect-2.1.0-go1.tar.gz
+sha256  96b81bb4c72eb8c1756febb94101c0dea5a6d4884591824e61a5f2509cd9ca9b  mender-connect-2.1.0-go2.tar.gz
 sha256  78b3954421ec6499c3f9735b96d52288574ae80c747416a52548d7f526f26e8c  LIC_FILES_CHKSUM.sha256
 
 # Vendor licenses
diff --git a/package/mender/mender.hash b/package/mender/mender.hash
index 03225c6e1d..118cce9d02 100644
--- a/package/mender/mender.hash
+++ b/package/mender/mender.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  8a149b11b990beb7620b372023eec28df63cee6a1aa4132e88ecef554f080f72  mender-3.4.0-go1.tar.gz
+sha256  8a149b11b990beb7620b372023eec28df63cee6a1aa4132e88ecef554f080f72  mender-3.4.0-go2.tar.gz
 
 # Vendor licenses
 # Generated with sed '/^[A-Za-z0-9_]/s/^/sha256  /' LIC_FILES_CHKSUM.sha256
diff --git a/package/mmc-utils/mmc-utils.hash b/package/mmc-utils/mmc-utils.hash
index bed6187857..fec7533d16 100644
--- a/package/mmc-utils/mmc-utils.hash
+++ b/package/mmc-utils/mmc-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  83b1bd7602b0c8d05a8ff2f842d80fa7c9a0b084b7159bb9eed796b0075b94d1  mmc-utils-e1281d4de9166b7254ba30bb58f9191fc2c9e7fb-git3.tar.gz
+sha256  4547b5f0f8a43857dcfb516b8b9c987d07febfecbe3d27987f43064db46ca8f9  mmc-utils-e1281d4de9166b7254ba30bb58f9191fc2c9e7fb-git4.tar.gz
 sha256  4207d81122a02555f78c5a11b61c83a331ee03dc933e1ef9dd932ef9b434d12d  README
diff --git a/package/moby-buildkit/moby-buildkit.hash b/package/moby-buildkit/moby-buildkit.hash
index 3e4b5b4e01..6b4fe1653b 100644
--- a/package/moby-buildkit/moby-buildkit.hash
+++ b/package/moby-buildkit/moby-buildkit.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1efa1c54b299c463c1b039d3df8ba1c68e70fe4de608fd14653fcebf9f27837b  moby-buildkit-0.11.6-go1.tar.gz
+sha256  1efa1c54b299c463c1b039d3df8ba1c68e70fe4de608fd14653fcebf9f27837b  moby-buildkit-0.11.6-go2.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/mxsldr/mxsldr.hash b/package/mxsldr/mxsldr.hash
index 8b6c11c29d..f5f5ddce0d 100644
--- a/package/mxsldr/mxsldr.hash
+++ b/package/mxsldr/mxsldr.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8ef7b7abb8d17c879e70b2c3911df8c5ce97f38779fa65d40be7f34febba55e1  mxsldr-2793a657ab7a22487d21c1b020957806f8ae8383-git3.tar.gz
+sha256  9bc18717c7b0c4a7b11a755ee68cc87355e33473ef762e2b26a8dbf143204660  mxsldr-2793a657ab7a22487d21c1b020957806f8ae8383-git4.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/nerdctl/nerdctl.hash b/package/nerdctl/nerdctl.hash
index 2d22dbace1..eabb9cf1db 100644
--- a/package/nerdctl/nerdctl.hash
+++ b/package/nerdctl/nerdctl.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  fff8c348efa4ff6753e1aacded0dedddcb255c50b00d8b3a37a660b1fb1dd31a  nerdctl-1.7.3-go1.tar.gz
+sha256  6037a0ce445d765d4fc411f7ee0a9e5ff616ea5b737e3a6b9a22a857073231e6  nerdctl-1.7.3-go2.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/netsurf-buildsystem/netsurf-buildsystem.hash b/package/netsurf-buildsystem/netsurf-buildsystem.hash
index 1716176683..9da8c67aef 100644
--- a/package/netsurf-buildsystem/netsurf-buildsystem.hash
+++ b/package/netsurf-buildsystem/netsurf-buildsystem.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  150a3a45c3f433a35451506b316a35c14630112fc557f9e1f02c9e08b50e0cce  netsurf-buildsystem-7574b41345968b5f7e9ca5875faccb1478ce0555-git3.tar.gz
+sha256  b8620c6a95ccf071046cdb8e4e0ca149cdd58d292eb9ee02b3b0d63646466b72  netsurf-buildsystem-7574b41345968b5f7e9ca5875faccb1478ce0555-git4.tar.gz
 sha256  b2ddc1d607332423f6cf415b2ac619a1c03dd565facdc39a571282a520929a65  llvm/LICENSE.TXT
diff --git a/package/odhcp6c/odhcp6c.hash b/package/odhcp6c/odhcp6c.hash
index d833eba9a0..f1641d7101 100644
--- a/package/odhcp6c/odhcp6c.hash
+++ b/package/odhcp6c/odhcp6c.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7274a304016838483e2da48193309e5f84ca0a8a407647033283d1249eebe986  odhcp6c-53f07e90b7f1da6977143a488dd5cb73a33b233b-git3.tar.gz
+sha256  c5cadd71a72e94df6b664d3e9f0b1eeffa779ba9624ab35b6a93c7172fe378a0  odhcp6c-53f07e90b7f1da6977143a488dd5cb73a33b233b-git4.tar.gz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/ogre/ogre.hash b/package/ogre/ogre.hash
index 40d0758638..963c521eaa 100644
--- a/package/ogre/ogre.hash
+++ b/package/ogre/ogre.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  805b97aacd2070f19394fe92442307a7ba6036ad95c511f551817d694c8dea37  ogre-v1.12.12-git3.tar.gz
+sha256  85d80ad2afe5e59b0ee8593f8bedbab8377a6772f21de310717798f6ca96010f  ogre-v1.12.12-git4.tar.gz
 sha256  82758e8d1d72139904b9b7472ef0f6544413d2871b58540307fdcc20e473e5f8  LICENSE
diff --git a/package/open62541/open62541.hash b/package/open62541/open62541.hash
index b8343d5c60..366a0894e3 100644
--- a/package/open62541/open62541.hash
+++ b/package/open62541/open62541.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e49f30c621784d490c8f8e4da808e3cab03ffca41d1aee9eb73ce01a65bcfd6d  open62541-v1.3.10-git3.tar.gz
+sha256  c78e0d2b1cb1a22db0102ed7f439073bc22ff44c5e9d9175f1b8e644f7b21f44  open62541-v1.3.10-git4.tar.gz
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/opkg-utils/opkg-utils.hash b/package/opkg-utils/opkg-utils.hash
index 4e4cca725b..982dbb5caf 100644
--- a/package/opkg-utils/opkg-utils.hash
+++ b/package/opkg-utils/opkg-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ad4fb6d01f2f18e986c556cca1ade584b109c277794af15977c354d2ecef9b52  opkg-utils-0.6.2-git3.tar.gz
+sha256  cbce8a9ad60ee34f27b9195146ff7ecfc37a3f97d2ce6bfc6610f46210f490f8  opkg-utils-0.6.2-git4.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/pcm-tools/pcm-tools.hash b/package/pcm-tools/pcm-tools.hash
index 2b4dec46a2..8017616130 100644
--- a/package/pcm-tools/pcm-tools.hash
+++ b/package/pcm-tools/pcm-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f3eae080e1bdc1f6264709534dff4881fb94d0d78c17ba4c8d0dbd816f6b17b9  pcm-tools-93fc9193a70e2f1f054be554c48f4a4791be5032-git3.tar.gz
+sha256  832929db1c84d1a50a40487a3c08b67182eabc99689050876430de59894c2714  pcm-tools-93fc9193a70e2f1f054be554c48f4a4791be5032-git4.tar.gz
 sha256  0f476c77009f982dcc4bdff41e692ddd456a9862908e99f2ae3d57296decc649  LICENSE
diff --git a/package/piglit/piglit.hash b/package/piglit/piglit.hash
index 887d8bfa5e..2c0b6aa52a 100644
--- a/package/piglit/piglit.hash
+++ b/package/piglit/piglit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  ec2a80c49f10761980334f1591be54ee6f365165d7ac637270b4ca15a12ad674  piglit-2affee53f3ad7a96f5b397a2b6d6408af8a374b0-git3.tar.gz
+sha256  ba4d1839038905f3833e9ab23b385913e08d552533dd222cc203c79c10e09918  piglit-2affee53f3ad7a96f5b397a2b6d6408af8a374b0-git4.tar.gz
 sha256  dcc398730859aee7cc1d6aa57f526f8d181b47bb3a49830e85b5723d5bc2c3bc  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licences/GPL-2
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  licences/GPL-3
diff --git a/package/prelink-cross/prelink-cross.hash b/package/prelink-cross/prelink-cross.hash
index 87ff86f674..6776d407b8 100644
--- a/package/prelink-cross/prelink-cross.hash
+++ b/package/prelink-cross/prelink-cross.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d7c95e81993edead813accf417f6d5b05bcc84eea9ee2d711b9505ffb4f2865b  prelink-cross-a853a5d715d84eec93aa68e8f2df26b7d860f5b2-git3.tar.gz
+sha256  555fd65c1b907f9b78d6d41ec04cb6e242d2ecb0667867e39cdd517b3f182dd3  prelink-cross-a853a5d715d84eec93aa68e8f2df26b7d860f5b2-git4.tar.gz
 sha256  b8a2f73f743dc1a51aff23f1aacbca4b868564db52496fa3c0caba755bfd1eaf  COPYING
diff --git a/package/psplash/psplash.hash b/package/psplash/psplash.hash
index 97ff534654..61514f57c0 100644
--- a/package/psplash/psplash.hash
+++ b/package/psplash/psplash.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c9f71754f4606e46212a4851d6c1145e4ae8752fd11a2b40e825f04bf79b22ec  psplash-44afb7506d43cca15582b4c5b90ba5580344d75d-git3.tar.gz
+sha256  06def825088f44422fad8a885077d917db6f47688457d4a0953c2ff6f6036378  psplash-44afb7506d43cca15582b4c5b90ba5580344d75d-git4.tar.gz
 sha256  f9c375a1be4a41f7b70301dd83c91cb89e41567478859b77eef375a52d782505  COPYING
diff --git a/package/qt-webkit-kiosk/qt-webkit-kiosk.hash b/package/qt-webkit-kiosk/qt-webkit-kiosk.hash
index 18638291b6..4eceb25485 100644
--- a/package/qt-webkit-kiosk/qt-webkit-kiosk.hash
+++ b/package/qt-webkit-kiosk/qt-webkit-kiosk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5c3992cc35260d165f9a16094bd224529f012f799e0bc21317a39480cedb1fd2  qt-webkit-kiosk-a7720e50f2bd70aad99e0b465f5c4a57aca48127-git3.tar.gz
+sha256  60cc4056277f1b24ec976b03e6ac6f07a46df1087cfb092a2fcb743776544392  qt-webkit-kiosk-a7720e50f2bd70aad99e0b465f5c4a57aca48127-git4.tar.gz
 sha256  de59ec6c939f4c4def79c0a996b3bd5626895fcbd1ae108e7bddb1dac8218381  doc/lgpl.html
diff --git a/package/qt5/qt5coap/qt5coap.hash b/package/qt5/qt5coap/qt5coap.hash
index e3fdbd36e6..669b264efe 100644
--- a/package/qt5/qt5coap/qt5coap.hash
+++ b/package/qt5/qt5coap/qt5coap.hash
@@ -1,5 +1,5 @@
 # Hash locally calculated
-sha256  0ad05a2305437b9b96a4322bfadaa26f043ba16845d5303e53c00c82b37b243f  qt5coap-5.15.2-git3.tar.gz
+sha256  de13d0160c2d0924558706e61382b84d8df7559c935e9873f7623d1dee18e476  qt5coap-5.15.2-git4.tar.gz
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5knx/qt5knx.hash b/package/qt5/qt5knx/qt5knx.hash
index 543b43a3a5..750e4770c0 100644
--- a/package/qt5/qt5knx/qt5knx.hash
+++ b/package/qt5/qt5knx/qt5knx.hash
@@ -1,5 +1,5 @@
 # Hash locally calculated
-sha256  df517ec632aca8d95150c73f4c43d1d396452b40d434b5f1969f266f127e1d70  qt5knx-5.15.2-git3.tar.gz
+sha256  1648bd6d7e5d8fc91aaa6db1bf9d2744d0385a087ba78a00080f99f1d5027c8b  qt5knx-5.15.2-git4.tar.gz
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
index 372db8bd00..062dfd42ff 100644
--- a/package/qt5/qt5location/qt5location.hash
+++ b/package/qt5/qt5location/qt5location.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  e94800d108e0f7a05df5586456fa812a0b6dd348623332b5cc8f837ccd206ebb  qt5location-0ec8f5e82da7369a92824167c4d7331f6c502325-git3.tar.gz
+sha256  7664c9f2bb8a111c939f988c1951737858e91754b9302476ae7cedcf112aa4a3  qt5location-0ec8f5e82da7369a92824167c4d7331f6c502325-git4.tar.gz
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5mqtt/qt5mqtt.hash b/package/qt5/qt5mqtt/qt5mqtt.hash
index 19cb44f5b2..6bbafac794 100644
--- a/package/qt5/qt5mqtt/qt5mqtt.hash
+++ b/package/qt5/qt5mqtt/qt5mqtt.hash
@@ -1,5 +1,5 @@
 # Hash locally calculated
-sha256  eb7b75ab3f8fa6f512c3e2ba05e1356d15bc850977197ebbd3d360528b05281c  qt5mqtt-5.15.2-git3.tar.gz
+sha256  cd92439c4d9597b8fd614e3c894b88860b5b9102d344b4b1195d14ae02c9275a  qt5mqtt-5.15.2-git4.tar.gz
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5opcua/qt5opcua.hash b/package/qt5/qt5opcua/qt5opcua.hash
index 4f699b949e..a325653f80 100644
--- a/package/qt5/qt5opcua/qt5opcua.hash
+++ b/package/qt5/qt5opcua/qt5opcua.hash
@@ -1,5 +1,5 @@
 # Hash locally calculated
-sha256  61a39fe7336709a9b2068e250713c2eb66fd3460b2c6e5f7bfc569b15b9cacb9  qt5opcua-5.15.2-git3.tar.gz
+sha256  fa8e0e87aae6f321aecac2605e6ac1b858ba1ed4db3c4a78a193eb7b547ab224  qt5opcua-5.15.2-git4.tar.gz
 
 # Hashes for license files:
 sha256  d93cc415382f0013088fa276d9cf82373badf244c78220a926f15ee46f0fe3c4  LICENSE-CC0
diff --git a/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.hash b/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.hash
index cfed23aef7..5a99c52e1f 100644
--- a/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.hash
+++ b/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5645823b0df22473e7c2a1368528d650536eed4575a1efbf63798a8a4b46766f  qt5webengine-chromium-catapult-5eedfe23148a234211ba477f76fc2ea2e8529189-git3.tar.gz
+sha256  cb1b81c3d9612185b9e981b7329cd49ef057d1afb6de84b88a2af58154d3a0ca  qt5webengine-chromium-catapult-5eedfe23148a234211ba477f76fc2ea2e8529189-git4.tar.gz
 sha256  f0df289ba9d03d857ad1c2f5918861376b1510b71588ffc60eff5c7a7bfedb09  LICENSE
diff --git a/package/rockchip-rkbin/rockchip-rkbin.hash b/package/rockchip-rkbin/rockchip-rkbin.hash
index 5296c6305b..3e25ffac0a 100644
--- a/package/rockchip-rkbin/rockchip-rkbin.hash
+++ b/package/rockchip-rkbin/rockchip-rkbin.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fef07aa31f65acd699e32b0e9639ac1d746b0a538e269065901520e0d92bd6fa  rockchip-rkbin-b4558da0860ca48bf1a571dd33ccba580b9abe23-git3.tar.gz
+sha256  7bb548b8c4dcd0f7d6b75c13e20d48eaac77f6218ad74e8a34c7f2097e793205  rockchip-rkbin-b4558da0860ca48bf1a571dd33ccba580b9abe23-git4.tar.gz
 sha256  1f2e25ae65f3af774e6f141f84253d6a05d489fb0b88b311220d70471c023c9c  LICENSE
diff --git a/package/rtc-tools/rtc-tools.hash b/package/rtc-tools/rtc-tools.hash
index af644e9f03..a3f3bdcc11 100644
--- a/package/rtc-tools/rtc-tools.hash
+++ b/package/rtc-tools/rtc-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8614e140b04da3dbb787760bdb0fe2ac5fe8907f5d3e9a74c6713e3d17fc3650  rtc-tools-33ef4aa1c92b0c92a351284d93d1ac5570de9cc7-git3.tar.gz
+sha256  68b6820aeb8132b3f034fb79cf761c4549373d67641afb05b58641f1d32bb69f  rtc-tools-33ef4aa1c92b0c92a351284d93d1ac5570de9cc7-git4.tar.gz
 sha256  7ae50a5344af14d6231aff6814632a220b3127da4099aea2c6070fd79c407c1a  COPYING
diff --git a/package/rtmpdump/rtmpdump.hash b/package/rtmpdump/rtmpdump.hash
index bc8c919024..feec5f4878 100644
--- a/package/rtmpdump/rtmpdump.hash
+++ b/package/rtmpdump/rtmpdump.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e362202d94b92632b17abc7ef909afc56de06a2cb40e308edfad901d799bbd9c  rtmpdump-c5f04a58fc2aeea6296ca7c44ee4734c18401aa3-git3.tar.gz
+sha256  810908e60c8f4e453bc828775937e4bad996fafac89b9546652f17e08a3dac81  rtmpdump-c5f04a58fc2aeea6296ca7c44ee4734c18401aa3-git4.tar.gz
 sha256  03fe7ca91cc28e99b4003d5b3bd4ce3b084d4c475fdf9975cf0e7fdf4dc739cd  librtmp/COPYING
diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index 88a7c1dc95..95d6c2ed19 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  be31b07d6a54a8f234016501c300ad04b6c428c56588e7eca8c3b663308db208  runc-1.1.12-go1.tar.gz
+sha256  be31b07d6a54a8f234016501c300ad04b6c428c56588e7eca8c3b663308db208  runc-1.1.12-go2.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/signal-estimator/signal-estimator.hash b/package/signal-estimator/signal-estimator.hash
index d4fbf771d4..656ca6ca9d 100644
--- a/package/signal-estimator/signal-estimator.hash
+++ b/package/signal-estimator/signal-estimator.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6256b881bd9285fdcf133628cf6dd6b0e2758c08bada231e44b2684a3cf7898f  signal-estimator-v0.0.4-git3.tar.gz
+sha256  cdf6ce2d0eec999c244e58159994ac304b41f6d299b6a3d8a5386105e6e966f5  signal-estimator-v0.0.4-git4.tar.gz
 sha256  e836fc784cb6ed2d160f1c1ecdf1303ed57436a86f66f97e5406a1b79e6db55e  LICENSE
diff --git a/package/sox/sox.hash b/package/sox/sox.hash
index e5cfc7726c..4e8a0682f8 100644
--- a/package/sox/sox.hash
+++ b/package/sox/sox.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  3d06ba8fc39ac92f16da73593be48afe0a704fe4dc4f6eca2e5137ef77cd5115  sox-7524160b29a476f7e87bc14fddf12d349f9a3c5e-git3.tar.gz
+sha256  acea032ef8543e4934bb1f4c821519456ad4bdad8d05b785043adbf07feba284  sox-7524160b29a476f7e87bc14fddf12d349f9a3c5e-git4.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  LICENSE.LGPL
diff --git a/package/tftpd/tftpd.hash b/package/tftpd/tftpd.hash
index 62434a9ad3..66e6b0d26c 100644
--- a/package/tftpd/tftpd.hash
+++ b/package/tftpd/tftpd.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  c86520c30dab0b6bcbae021ab26d2ac63227696596d37a9b02aa3e56ec5c2e77  tftpd-b2b34cecc8cbc18ff6f1fc00bda6ae6e9011e6c7-git3.tar.gz
+sha256  0eb23ceca54eac3648ca4254a4664241483ddc6bef36958e1cf23bc994d15863  tftpd-b2b34cecc8cbc18ff6f1fc00bda6ae6e9011e6c7-git4.tar.gz
 
 # Hash for license file
 sha256  67754ebd8f265571d3226ac97e521b1bd6fd8a61363ecd4ab7806a6f90efab92  tftpd/tftpd.c
diff --git a/package/ti-sgx-demos/ti-sgx-demos.hash b/package/ti-sgx-demos/ti-sgx-demos.hash
index 3e3e2a23f3..ac15b9f887 100644
--- a/package/ti-sgx-demos/ti-sgx-demos.hash
+++ b/package/ti-sgx-demos/ti-sgx-demos.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  5564741d7669b6303e52f4c0d1eaa04aa2633c0c6ad8ff7c5295b7ef3764c719  ti-sgx-demos-bb8b74cdd1323e76697b3eb2258f863b15fee287-git3.tar.gz
+sha256  be150a42915e71129aeb9d444dd5ce99ab85a91f4cdac750ca2bf98334a6afdd  ti-sgx-demos-bb8b74cdd1323e76697b3eb2258f863b15fee287-git4.tar.gz
 sha256  052741ea66a4a48e0ef8cab259d2dc136e7cf52fda694af8d1fe9bd28abe333b  LegalNotice.txt
diff --git a/package/ti-sgx-km/ti-sgx-km.hash b/package/ti-sgx-km/ti-sgx-km.hash
index c992b532cc..dcc490033c 100644
--- a/package/ti-sgx-km/ti-sgx-km.hash
+++ b/package/ti-sgx-km/ti-sgx-km.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  213b4ff3893c74f026a06404dca185216809d062e54d17c2302d56ff7ede5181  ti-sgx-km-cf7f48cb30abfd5df7a60c9bf4bbb1dde0d496d9-git3.tar.gz
+sha256  4d6e556ee4d1f6e6e4a542273760b181ba23f152445240ed6d8749ef2963bbae  ti-sgx-km-cf7f48cb30abfd5df7a60c9bf4bbb1dde0d496d9-git4.tar.gz
 sha256  e9d660547691b2a9232850fd43aac16d40fd063023166fd27162020c30dc2bd4  eurasia_km/GPL-COPYING
diff --git a/package/ti-sgx-um/ti-sgx-um.hash b/package/ti-sgx-um/ti-sgx-um.hash
index 15c49ce587..ff83d38659 100644
--- a/package/ti-sgx-um/ti-sgx-um.hash
+++ b/package/ti-sgx-um/ti-sgx-um.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  8e2bf59142a96d05c4600ca19cc70f0a359e3bc832a2c1922b4459caca498a2f  ti-sgx-um-909e237baf47d0bde006ff25552f5403fd7e359d-git3.tar.gz
+sha256  1d82e42ed7114759424cf25167e95b20f2babbfad3ee2ae8ac60d12c908bc73d  ti-sgx-um-909e237baf47d0bde006ff25552f5403fd7e359d-git4.tar.gz
 sha256  368c306246c9130b5c90a6fef2f80085f70b6225b3f552654a288c0f39fc1531  TI-Linux-Graphics-DDK-UM-Manifest.doc
diff --git a/package/tinifier/tinifier.hash b/package/tinifier/tinifier.hash
index 9c1fb11dda..c43e77b88f 100644
--- a/package/tinifier/tinifier.hash
+++ b/package/tinifier/tinifier.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  927e966f9d23ea7cc1942967a8fc16ef4c55c51bd096d44f54b418844a51aa12  tinifier-3.4.0-go1.tar.gz
+sha256  a56fd648cdc86f82837fedfd3e1a9ecc5750f15be24630ea1533d64fc6d1c2bb  tinifier-3.4.0-go2.tar.gz
 sha256  18f524914c0df04e21289c3d9ca3e27c10abe5869cc4e4d4790a1b2c56df282c  LICENSE
diff --git a/package/tl-expected/tl-expected.hash b/package/tl-expected/tl-expected.hash
index c18a0ea941..5e99063790 100644
--- a/package/tl-expected/tl-expected.hash
+++ b/package/tl-expected/tl-expected.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2611769546cedcaef233ef587e71420d1f079a794eb7bb19b888dedf991ace7c  tl-expected-v1.0.0-git3.tar.gz
+sha256  628a0ec9ed258b596669494c679e7d6ec4d35f3a2629669499bc8ea20d410b58  tl-expected-v1.0.0-git4.tar.gz
 sha256  a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499  COPYING
diff --git a/package/tremor/tremor.hash b/package/tremor/tremor.hash
index 4e599be644..246378f5f5 100644
--- a/package/tremor/tremor.hash
+++ b/package/tremor/tremor.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a387ebb4536ca98034eb91855616b971b0a85575943699b2a6d0be79b4a9f6a9  tremor-7c30a66346199f3f09017a09567c6c8a3a0eedc8-git3.tar.gz
+sha256  4ff8e311a35218c3b411a617196b5c367f5e120fad394eb61400f9c2742e5d0a  tremor-7c30a66346199f3f09017a09567c6c8a3a0eedc8-git4.tar.gz
 sha256  d2ab5758336489da61c12cc5bb757da5339c4ae9001f9bb0562b4370249af814  COPYING
diff --git a/package/ubus/ubus.hash b/package/ubus/ubus.hash
index 90107c0127..af70e86e46 100644
--- a/package/ubus/ubus.hash
+++ b/package/ubus/ubus.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e3022aa3cf6c38a4d3c0d798d9a9c7069ada063a0a5fe6894b466b71b17ce9cc  ubus-f787c97b34894a38b15599886cacbca01271684f-git3.tar.gz
+sha256  0020c808d0ba74b1f4c9514e2b3dfa98ec13a142c97b86b9c229479c560aca19  ubus-f787c97b34894a38b15599886cacbca01271684f-git4.tar.gz
 sha256  a3caa6c0e90c87b7c97c2ac3d0c0d416082ef777215faec2e9b24ea6e68f6988  ubusd_acl.h
diff --git a/package/uclibc-ng-test/uclibc-ng-test.hash b/package/uclibc-ng-test/uclibc-ng-test.hash
index a82c352eec..dc0499001e 100644
--- a/package/uclibc-ng-test/uclibc-ng-test.hash
+++ b/package/uclibc-ng-test/uclibc-ng-test.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f261229c43c026e39178aca48f4f3caacd0bbe373ccd06d27954e7a5fa768fe8  uclibc-ng-test-0f303c63fab7f4038515ced6f2659242cf60ac19-git3.tar.gz
+sha256  7f5badc6621eb9dbc9030121bfa6d4d1ccf680a346cd15c6dca05a6e03010d96  uclibc-ng-test-0f303c63fab7f4038515ced6f2659242cf60ac19-git4.tar.gz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
diff --git a/package/uemacs/uemacs.hash b/package/uemacs/uemacs.hash
index 1d1d270907..cc1d5fe751 100644
--- a/package/uemacs/uemacs.hash
+++ b/package/uemacs/uemacs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  96e30247365bb27bd74c550b637f5b2ffd2978379872a32a840f6667cec5fa2a  uemacs-1cdcf9df88144049750116e36fe20c8c39fa2517-git3.tar.gz
+sha256  f262345902e18569efd097f68705cfdfd9c2585dec108019629dd91b835c8ca6  uemacs-1cdcf9df88144049750116e36fe20c8c39fa2517-git4.tar.gz
 sha256  6e2a4cf41ec8d4379c154923349733bc0d3935c6fa72c4337cf1bc137b98b90a  README
diff --git a/package/uhttpd/uhttpd.hash b/package/uhttpd/uhttpd.hash
index 44c7660806..e84d2dc3ed 100644
--- a/package/uhttpd/uhttpd.hash
+++ b/package/uhttpd/uhttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9ae10aaf6642b214e0a4ca47d6fd9693ac4b88d61e7d6446f0f0feb3a28ca510  uhttpd-15346de8d3ba422002496526ee24c62a3601ab8c-git3.tar.gz
+sha256  397aa4bccc4acb06031270d4a549fb266fec3950a88fe3523f0d7de74caff010  uhttpd-15346de8d3ba422002496526ee24c62a3601ab8c-git4.tar.gz
 sha256  ce1803f83f776cc88661e303fede0e5ff52faf1d9f74508fadbecf7705b4c84d  uhttpd.h
diff --git a/package/uqmi/uqmi.hash b/package/uqmi/uqmi.hash
index 3f5ea02cb9..3277b17645 100644
--- a/package/uqmi/uqmi.hash
+++ b/package/uqmi/uqmi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  aae6a72791da8f58012303ba3bfeeb613e74597cbebfb9e7c2d9125e6f256799  uqmi-0a19b5b77140465c29e2afa7d611fe93abc9672f-git3.tar.gz
+sha256  ecec1ab5a9cf91e54d29496d6793ce5821246261b99c743126899fcf9837af48  uqmi-0a19b5b77140465c29e2afa7d611fe93abc9672f-git4.tar.gz
 sha256  a69bf44dbff15d727578d2069a654d60e9034c5e2cc3e199a012e72afef6c259  main.c
diff --git a/package/ustream-ssl/ustream-ssl.hash b/package/ustream-ssl/ustream-ssl.hash
index fb97ebc834..30686e1ce4 100644
--- a/package/ustream-ssl/ustream-ssl.hash
+++ b/package/ustream-ssl/ustream-ssl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e77e579b718085c1447339e0fcd5385b85a783d5c92544e48a6b37b1695a7f39  ustream-ssl-68d09243b6fd4473004b27ff6483352e76e6af1a-git3.tar.gz
+sha256  932703fb2875e589e6e0ffc787e5bc57a9f424cb23692fcefa78b1e6afa80700  ustream-ssl-68d09243b6fd4473004b27ff6483352e76e6af1a-git4.tar.gz
 sha256  cf28f0f01a57423983fa062eb0f04bb1a78891863cb58c53059c3d8cb52c1dd4  ustream-ssl.h
diff --git a/package/vboot-utils/vboot-utils.hash b/package/vboot-utils/vboot-utils.hash
index 2421776533..1b622f25bf 100644
--- a/package/vboot-utils/vboot-utils.hash
+++ b/package/vboot-utils/vboot-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8ad1539e0f84e94220c17eb55ce6d755ea8fc14a30c719712837a5fb4f9c09f0  vboot-utils-bbdd62f9b030db7ad8eef789aaf58a7ff9a25656-git3.tar.gz
+sha256  3e7b7e7f831e16cb07a7a09e1b74f1fff096d99b13c0d0d90d51ec3f80acd90b  vboot-utils-bbdd62f9b030db7ad8eef789aaf58a7ff9a25656-git4.tar.gz
 sha256  cb9dc8e96aedf9120b6757a60387db10f3c1a8e3fd97bb9d0f11327be5a7ed4d  LICENSE
diff --git a/package/wilink-bt-firmware/wilink-bt-firmware.hash b/package/wilink-bt-firmware/wilink-bt-firmware.hash
index 7fbc7db70c..92da07ec2f 100644
--- a/package/wilink-bt-firmware/wilink-bt-firmware.hash
+++ b/package/wilink-bt-firmware/wilink-bt-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  209e1a46a945e7d4d031e22fb7bd1e3fc96fa3b99d069051ce257c5e2e0843f4  wilink-bt-firmware-43fca73c6a98c63fcb98f82af5bf83761778e005-git3.tar.gz
+sha256  74e5c8912f1a7e65799da5f3ad44fda570446af2c7324f3a8051a166065b643b  wilink-bt-firmware-43fca73c6a98c63fcb98f82af5bf83761778e005-git4.tar.gz
 sha256  21fd99ce784dc33b39ec0b4a383a9a9b8dafea261d73ad4548683c4eecd87f37  LICENSE
diff --git a/package/wtfutil/wtfutil.hash b/package/wtfutil/wtfutil.hash
index 53904d1a36..d4afbdc050 100644
--- a/package/wtfutil/wtfutil.hash
+++ b/package/wtfutil/wtfutil.hash
@@ -1,2 +1,2 @@
-sha256  d15b2e8833d31d5b1ad7b4317777dc7aa045124d1d91994f02c9b5709f09fef3  wtfutil-0.41.0-go1.tar.gz
+sha256  1f2a3a037b0e4967039d2241cbe2ba3693a60bd92bd0047cc3361b0faad2a7b6  wtfutil-0.41.0-go2.tar.gz
 sha256  b59f3dbd83c6aa4e003b6eafa80bc53f0629e4d164e8b125c56869c2603dbc8f  LICENSE.md
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
index 56140be59e..8d091d6297 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ad4230b9810324cd643c1de25c21d16e08c2bef3d41b751bd0346f8427ca44fa  xdriver_xf86-video-intel-31486f40f8e8f8923ca0799aea84b58799754564-git3.tar.gz
+sha256  31ae2330e07a23944e759ee2f320bdaa5760f6871cec34fd304205e8199c1dfd  xdriver_xf86-video-intel-31486f40f8e8f8923ca0799aea84b58799754564-git4.tar.gz
 sha256  5808e89f4b9a30afc59f335bfa8219ecf2dacb89a81d16b322bc6d92993a48fa  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.hash b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.hash
index 959cfc1e10..3b011c95cb 100644
--- a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.hash
+++ b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  037bebbe31bcca2b4f3adeefccd2a64a30e2924946a6c6646c5829f7362212ec  xdriver_xf86-video-openchrome-ab03de703b91c7e0fd3e4d1ca06ad5add7f077a1-git3.tar.gz
+sha256  2495ef208415ef9d2173322df0ec3a29f2d0a83051b0a19c89cd4178d0def029  xdriver_xf86-video-openchrome-ab03de703b91c7e0fd3e4d1ca06ad5add7f077a1-git4.tar.gz
 sha256  1fde58bce5cff8c32e9a0a80bfa3e60213a2767954e30a367127d5afa2884ca2  COPYING
diff --git a/package/x264/x264.hash b/package/x264/x264.hash
index c6bff5d853..dc2d3d7b5b 100644
--- a/package/x264/x264.hash
+++ b/package/x264/x264.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e83cda2a69e72bc45bcb14aa7ca5e689cf0f67dc29fc6f1dce63abe2a428fc01  x264-baee400fa9ced6f5481a728138fed6e867b0ff7f-git3.tar.gz
+sha256  adb3f2f780607420134def42d0fac58be9c6de718a451f3f0ec56236a783f937  x264-baee400fa9ced6f5481a728138fed6e867b0ff7f-git4.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/yavta/yavta.hash b/package/yavta/yavta.hash
index 326da91795..9809283fd0 100644
--- a/package/yavta/yavta.hash
+++ b/package/yavta/yavta.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  108a0ceec862b56a3fbcb3ad28a8744d9800555ccb3e11bdd94c8cd4614296d5  yavta-583bedefc2a247d2cfd32d1b4a0abbe3e2015c70-git3.tar.gz
+sha256  ede218b7f19088f87e8e2e7becf909e99d52efb3435c88748444a6f617986883  yavta-583bedefc2a247d2cfd32d1b4a0abbe3e2015c70-git4.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.GPL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
