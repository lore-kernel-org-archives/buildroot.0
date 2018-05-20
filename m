From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 11:43:45 +0200
Subject: [Buildroot] [git commit] libmodbus: add hash for license file
Message-ID: <20180520095026.5A85880404@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc69f0c44612a9090133f2d735612111548c0b1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libmodbus/libmodbus.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libmodbus/libmodbus.hash b/package/libmodbus/libmodbus.hash
index b5c4450d6b..2d65e28a34 100644
--- a/package/libmodbus/libmodbus.hash
+++ b/package/libmodbus/libmodbus.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256  c8c862b0e9a7ba699a49bc98f62bdffdfafd53a5716c0e162696b4bf108d3637  libmodbus-3.1.4.tar.gz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
