From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2021 07:35:01 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/dnsmasq: bump
 version to 2.84
Message-ID: <20210217064713.BF19681620@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=038ad401fceeb68b303ba81ac3fc352483d44a2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Bugfix release, fixing a regression introduced in 2.83.  For more details,
see the announcement:

http://lists.thekelleys.org.uk/pipermail/dnsmasq-discuss/2021q1/014640.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8fcdd2023ee6bc2efd96a3b43fec103f2afa0e2f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2dada92a307382b7de4df6469734027d1c5a0f50)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dnsmasq/dnsmasq.hash | 2 +-
 package/dnsmasq/dnsmasq.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.hash b/package/dnsmasq/dnsmasq.hash
index 6c19dad791..d141fb0c83 100644
--- a/package/dnsmasq/dnsmasq.hash
+++ b/package/dnsmasq/dnsmasq.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
 # https://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.83.tar.xz.asc
-sha256  ffc1f7e8b05e22d910b9a71d09f1128197292766dc7c54cb7018a1b2c3af4aea  dnsmasq-2.83.tar.xz
+sha256  603195c64b73137609b07e1024ae0b37f652b2f5fe467dce66985b3d1850050c  dnsmasq-2.84.tar.xz
 # Locally calculated
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING-v3
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 4d03abd7e1..6e8782d1d6 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DNSMASQ_VERSION = 2.83
+DNSMASQ_VERSION = 2.84
 DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
