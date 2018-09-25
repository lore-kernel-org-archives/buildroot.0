From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Sep 2018 22:17:37 +0200
Subject: [Buildroot] [git commit] iputils: Add hash for ninfod/COPYING
 license file
Message-ID: <20180925202114.D94BD88D46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3918f83942e50772ac91e5a65401d466ab456bfa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/iputils/iputils.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/iputils/iputils.hash b/package/iputils/iputils.hash
index 89c3ab6013..14e2c67134 100644
--- a/package/iputils/iputils.hash
+++ b/package/iputils/iputils.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 da14105291dd491f28ea91ade854ed10aee8ba019641c80eed233de3908be7c5  iputils-s20180629.tar.gz
+sha256 966075293e45785230c19415bcda15bd07c75bead4fe73332d1a4b9c45bb321f  ninfod/COPYING
