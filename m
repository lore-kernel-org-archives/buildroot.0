From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 3 Jun 2018 20:23:52 +0200
Subject: [Buildroot] [git commit] package/mesa3d: update patents.txt file
 hash
Message-ID: <20180603182225.C918883877@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b0fdf587ba9b454c83b36a80320d803be191190e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Google patent url has been updated with 18.1 mesa3d release [1].

Fixes:
http://autobuild.buildroot.net/results/00f/00fd8fbc1e89a29b60ed9c6906035dbe4f0a3eb8

[1] https://cgit.freedesktop.org/mesa/mesa/commit/?id=ac731531a1e43e4fa3e10099380a3bba68d65bfd

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d/mesa3d.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index fb72f4f683..d8c7105fe7 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -5,4 +5,4 @@ sha256 d3312a2ede5aac14a47476b208b8e3a401367838330197c4588ab8ad420d7781  mesa-18
 sha512 7783adc1ec7a1c3d092acfcca6b4ba19450c15a7f0d7f41fbf25e482236615d79ce24afe60959066ea7aa851df4f74fa3c569fa6d847ea79e6bfe046b8c65e90  mesa-18.1.1.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
-sha256 a75ee0cec909515ff80a3ec07155b7fb0aafe8051abe1f0e45d5c4c5e2539366  docs/patents.txt
+sha256 3a0cf6c7835f98f86d5579b2cc517f84254da7411f764fb0095a383fb0759771  docs/patents.txt
