From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu, 13 Sep 2018 07:49:27 +0200
Subject: [Buildroot] [PATCH] bluez-alsa: correct LICENSE.txt hash
Message-ID: <20180913054927.29317-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After bumping from v1.3.0 to v1.3.1 hash has not been recalculated.
2018 J?rg Krause has been added to LICENSE.txt

Recalculate correct LICENSE.txt hash and add it to bluez-alsa.hash file.

Fixes:
http://autobuild.buildroot.net/results/40c/40c35c1c3470a5ece7e9f82525efaceabfaaf841/
http://autobuild.buildroot.net/results/a0b/a0bcd9c7a308cd09e8cfb7632970b52989d7bff7/
http://autobuild.buildroot.net/results/7de/7deb42c0b8325d211805a3211b5b475edc60ec57/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/bluez-alsa/bluez-alsa.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bluez-alsa/bluez-alsa.hash b/package/bluez-alsa/bluez-alsa.hash
index 5036f82eaa..ba81eadf34 100644
--- a/package/bluez-alsa/bluez-alsa.hash
+++ b/package/bluez-alsa/bluez-alsa.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  20005c4a153346ea7941973e9b7bd0b228417351f2e8ce88d1c02cc62bca188e  bluez-alsa-v1.3.0.tar.gz
-sha256  4738489ada14818fe4c53ce86223d7b2f4c1f57cb1f93d62c973c94a89080e83  LICENSE.txt
+sha256  29dad23877d0cf46a16e2f8d3746219e89068c33d052059caf1caaacd8b40cac  bluez-alsa-v1.3.1.tar.gz
+sha256  9a18d8b11802d0cec100839a0676a6fc48a4179f8f70b8e12a7f3d6b7a8fd70a  LICENSE.txt
-- 
2.17.1
