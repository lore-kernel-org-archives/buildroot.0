From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Mar 2020 19:21:35 +0100
Subject: [Buildroot] [git commit] package/linux-firmware: fix hashes for
 license files
Message-ID: <20200309140908.AC41681268@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d856fb44c098494de557139072655d44353d092
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 48cc1a89ae (package/linux-firmware: bump to version 20200122)
forgot to account for an update in the copyright year for the AMD blobs,
as well as a global update to the WHENCE file (which lists all the
blobs and their licenses).

Fixes:
    http://autobuild.buildroot.org/results/372abcf91592ef4a1231de6364b0848ff131e432/

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/linux-firmware/linux-firmware.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index eff0c4cbb2..573c33cbc9 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,7 +1,7 @@
 # Locally calculated
 sha256 83646c58fc4e3ee9a73f4fa74213c849109f48c719322346393f3e5b0fa55044 linux-firmware-20200122.tar.gz
 sha256 8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9 LICENCE.Abilis
-sha256 ac7c42c8331ef69221039f770193a2120bc67c7bba357e51a5b3f557bca0037c LICENSE.amdgpu
+sha256 8d5847d2971241d4d6a51c16e206379de53a6d4e203fa6f8e1c1e9279c7c4ad0 LICENSE.amdgpu
 sha256 2d6062d63b91eb750bf741498691604f75184b9fee97608ec537cd09bd6a42b4 LICENCE.Marvell
 sha256 802b7014b26c606cf6248ae8b0ab1ce6d2d1b0db236d38dd269e676cd70710f2 LICENCE.atheros_firmware
 sha256 3b5eb392b2d9d8c46d6aae26d06c187e5ea3029b12d13bc2b8deb8b3ce6bfa53 ath10k/QCA6174/hw3.0/notice_ath10k_firmware-4.txt
@@ -28,6 +28,6 @@ sha256 8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e LICENSE.
 sha256 be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc LICENSE.qcom
 sha256 fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f LICENSE.radeon
 sha256 2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9 LICENSE.sdma_firmware
-sha256 440c2ed4fba90edb52847f1550ff33fbfb36f61688eecced84c22dfc247f31e9 WHENCE
+sha256 74d203d2fd433b73b63e8e31d8928e3817f6eaf3407c9e607802c20a5c02e6c4 WHENCE
 sha256 fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a qcom/NOTICE.txt
 sha256 bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604 LICENCE.e100
