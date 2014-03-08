From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Mar 2014 15:09:57 +0100
Subject: [Buildroot] [git commit] jack2: needs BR2_PACKAGE_ALSA_LIB_RAWMIDI
Message-ID: <20140308141030.5F14D9BE0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0ac17ecc21d00826c0c21f0076d044a44473d584
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/f45/f4558837adeb89650beb9d74a3bd97616e412a8f/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jack2/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/jack2/Config.in b/package/jack2/Config.in
index 978c7a8..bf70ab0 100644
--- a/package/jack2/Config.in
+++ b/package/jack2/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_JACK2
 	select BR2_PACKAGE_LIBSNDFILE
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_ALSA_LIB_SEQ
+	select BR2_PACKAGE_ALSA_LIB_RAWMIDI
 	help
 	  JACK Audio Connection Kit (server and example clients).
 
