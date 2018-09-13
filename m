From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Sep 2018 20:43:26 +0200
Subject: [Buildroot] [git commit] bluez-alsa: correct LICENSE.txt hash
Message-ID: <20180913184355.18C94880B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=289b9018d929e41fbad789d20e911932e0dc57a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After bumping from v1.3.0 to v1.3.1 hash has not been recalculated.

Changes in LICENSE.txt:
2018 J??rg Krause has been added to LICENSE.txt

Recalculate correct LICENSE.txt hash and add it to bluez-alsa.hash file.

Fixes:
http://autobuild.buildroot.net/results/40c/40c35c1c3470a5ece7e9f82525efaceabfaaf841/
http://autobuild.buildroot.net/results/a0b/a0bcd9c7a308cd09e8cfb7632970b52989d7bff7/
http://autobuild.buildroot.net/results/7de/7deb42c0b8325d211805a3211b5b475edc60ec57/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bluez-alsa/bluez-alsa.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bluez-alsa/bluez-alsa.hash b/package/bluez-alsa/bluez-alsa.hash
index 3463ecf8d3..ba81eadf34 100644
--- a/package/bluez-alsa/bluez-alsa.hash
+++ b/package/bluez-alsa/bluez-alsa.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
 sha256  29dad23877d0cf46a16e2f8d3746219e89068c33d052059caf1caaacd8b40cac  bluez-alsa-v1.3.1.tar.gz
-sha256  4738489ada14818fe4c53ce86223d7b2f4c1f57cb1f93d62c973c94a89080e83  LICENSE.txt
+sha256  9a18d8b11802d0cec100839a0676a6fc48a4179f8f70b8e12a7f3d6b7a8fd70a  LICENSE.txt
